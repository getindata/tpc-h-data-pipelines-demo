{% docs generate_schema_name %}

Macro provided by the DP Tool for generating schema name.

{% enddocs %}

{% docs generate_source_modified %}

The dbt-labs/codegen **generate_source** macro modified with additional description templates for models and columns.

{% enddocs %}

{% docs generate_staging_models %}

The dbt-labs/codegen **generate_source** macro modified with additional description templates for models and columns.

{% enddocs %}

{% docs test_ISO_country_name_check %}

This generic test was designed to check whether the country name provided in the column containing names of the countries is in agreement with the ISO country names listed in the additional .csv file. This csv file called "**ISO_countries.csv**" has to be uploaded into data warehouse, preferably usig dbt seed command (the file has been attached into the seeds folder of the project). 

This test will fail while testing source tables. As an alternative, table **ISO_contries_with_additions.csv** has been also attached. It contains the list of ISO country names and their popular aliases. Using this seed will cause the test to pass (this requires changes in the ISO_country_check.sql macro).

{% enddocs %}

{% docs test_country_phone_code_check %}

This generic test aims to check whether the customers declared phone number and country match. It uses the list of the coutries and their phone codes stored in the **Country_PhoneCodes.csv** seed file and pairs the the first two numbers of the customers phone (in tested table) with the default code given in the seed. If any of the country names in a tested table does not match the country name in a seed table, the resulting difference is returned as a record and the test fails. 

The business importance of this test is especialy high for the dim_customer_without_orders_for_Q22 model. In this model the phone code (first two numbers of the phone number) is used to determine the place where there are customers, who may be likely to make a purchace. The discrepancy between the real customers address (country) and their stated phone number would corrupt the results.

{% enddocs %}

{% docs test_is_phone_number_valid %}

This generic test checks whether the provided phone number has a valid formatting: XX-XXX-XXX-XXXX where X stands for any integer between 0 and 9.

{% enddocs %}