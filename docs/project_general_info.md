{% docs __analytics_demo__ %}

# DBT Project for data pipeline framework demo

### Refactoring Business querries

![TPCH refactoring project overview](https://i.postimg.cc/NGKtG4ck/tpc-h-schema.jpg)

Translation of business querries into DBT models can be performed using various strategies. There is no universal solution for all projects, and the amount of possible refactoring patterns grow with the complexity of the querries, as well as their numbers. Thus, refactoring strategy should be considered as case-specific. Here, we follow dbt good practices and implement the following layer structure.
The project models are cathegorized based on their purpose and destination:
- **Staging layer** represents the models that have a direct connection to (they are sourced by) the raw tables (the raw data in DWH). Those models are subjected to minor transformations (cleaning, aliasing) and are materialized as views as default. They stand as an alternative for base (base_) models.
- The secondary models are represented in the **intermediate layer**. They stand as connection between the staging and busines models. In the intermediate layer a preliminary joining and agregating is performed. By default intermediate models materialize as ephemeral tables and they cannot be referenced in both dbt and data warehouse. .
- The third layer representes busines-oriented querries. The data transformed here is dedicated for analysis and exploration of specific business topics. The busines oriented models in the **presentation layer** are groupped into two cathegories here: *general* and a specific sublayer called *audit_models*. General models allow exploration of the data but are oriented towards the logic of the original business queries. Those models are meant to act as an input for i.e. interactive reporting (dashboards) through an external BI tool. Therefore, they should represent some broader set of values obtained as a result of transfomations performed in staging and intermediate layers. The other group of SQLs, *specific* models (the *audit_models sublayer*), are grouped in a subfolder - Audit_models. They act as a subcategory for presentation models, with well defined, specific boundary conditions required to answer the original business problem. They serve as an input for static reporting and (which is also cruical here) input for the audit.

The following busines queries have been translated into dbt models:
- Minimum Cost Supplier Query Q2
- Shipping Priority Query Q3
- Volume Shipping Query Q7
- Important Stock Identification Query Q11
- Shipping Modes and Order Priority Query Q12
- Promotion Effect Query Q14
- Top Supplier Querry Q15
- Parts/Supplier Relationship Query Q16
- Global Sales Opportunity Query Q22

**The audit layer**

In the following project the fourth layer has been added. The so called "audit layer" is built by models based on dbt-labs/audit_helper package. Models placed here are design to perform double-check on the result of legacy SQLs transition into dbt models. The layer consists of:
- Audit_models (explained above) and...
- Legacy SQLs, the original SQL querries which answer ad hoc business questions introduced in the tpc-h documentation. These SQL querries serve here as baseline for auditing the project.

The presence of the audit layers is generaly *optional*, but strongly recommended while refactoring existing (and functional) SQLs. Although the results can be checked manualy (by, for example, comparing exported results with original tables at random), this may be inefficient, especially for larger tables. *Dbt-labs/audit* package allows for quick and precise comparison between two outputing tables (given their structire is desired to be similar, if not identical), it provides both qualitative and quantitative information about the discrepancy (if any occured). It is important that after performing (and reporting) an succesful audit, the audit layer should not be passed into production. It is, in fact, designed to be the the one time process, not concidered in the final data pipeline. For the demonstratory purposes the audit and the legacy models are present in the project, they have been set inactive though (disabled from the dbt_project.yml level). In order run the full dbt pipeline (including audit) following changes in the project configuration file need to be addressed:
```
# in the dbt_project.yml:

models:

    legacy: # The SQL querries subjected to refactoring, they should not be triggered bt dbt after approving the audits resuls.
      +enabled: false # type "true" or uncomment it in order to enable legacy models
      +materialized: view
      +schema: legacy

    audit: # The result of auditing models in presentation layer with legacy SQLs. They should not be treiggered by dbt after approving the audits resuls.
      +enabled: false # type "true" or uncomment it in order to enable the audit layer
      +materialized: table
      +schema: audit
```

Naming convention for the models in this project aims to identify the specific ad hoc querries presented in the TPC-H documentation. The decission has been made subjectively and may (and should) be reviewed.

### Materialization

By default all layers in the project have following predefined materialization configured in the dbt_project.yml:
```
models:

  analytics_demo:

    staging:
      +materialized: view
      +schema: staging

    intermediate:
      +materialized: ephemeral
      +schema: intermediate

    presentation:
      +materialized: table
      +schema: presentation
```
For some specific models this materialization schema was changed and the [incremental materialization](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/configuring-incremental-models/) has been introduced. This is the case for chosen presentation models having stg_lineitem or stg_orders reference in the upstream. Incremental materialization reduces the dbt consecutive run time for large tables.

Models with the incremental materialization:
- fct_lineitem_part_promotion_cases_for_Q14
- fct_top_supplier_general_querry_Q15
- fct_customer_orders_lineitem_for_Q3 (in this case the [incremental materialization with partitioning](https://docs.getdbt.com/reference/resource-configs/bigquery-configs#using-table-partitioning-and-clustering) has been adapted)

### Tests

The following section describes the idea behind three customized generic tests created and implemented for selected models. Apart of them, the models built in the presentation layer are subjected to a variety of tests provided by the dbt-labs/dbt_utils and catalogica/dbt_expectations packages in order to check the integrity of the data (ie. correct data type, accepted data range etc, duplicates etc.).

- country_phone_code_check (custom generic test)

This generic test aims to check whether the customers declared phone number and country match. It uses the list of the coutries and their phone codes stored in the Country_PhoneCodes.csv seed file and pairs the the first two numbers of the customers phone (in tested table) with the default code given in the seed. If any of the country names in a tested table does not match the country name in a seed table, the resulting difference is returned as a record and the test fails. The business importance of this test is especialy high for the dim_customer_without_orders_for_Q22 model. In this model the phone code (first two numbers of the phone number) is used to determine the place where there are customers, who may be likely to make a purchace. The discrepancy between the real customers address (country) and their stated phone number would corrupt the results.

- is_phone_number_valid

This generic test checks whether the provided phone number has a valid formatting:
XX-XXX-XXX-XXXX
where X stands for any integer between 0 and 9.

- ISO_country_name_check (custom generic test)

This generic test was designed to check whether the country name provided in the column containing names of the countries is in agreement with the ISO country names listed in the additional .csv file. This csv file called "ISO_countries.csv" has to be uploaded into data warehouse, preferably usig dbt seed command (the file has been attached into the seeds folder of the project). This test will fail while testing source tables. As an alternative, table ISO_contries_with_additions.csv has been also attached. It contains the list of ISO country names and their popular aliases. Using this seed will cause the test to pass (this requires changes in the ISO_country_check.sql macro).

## Resources:

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Learn more about [TPC-H benchmark & database](http://www.tpc.org/tpch/)

{% enddocs %}