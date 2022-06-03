{% docs dim_country_region %}

The following model provides CTE for joined tables: **stg_nation** and **stg_region** as a base for further processing.

{% enddocs %}

{% docs dim_customer_country_region %}

The following model provides CTE for customer table (from the **stg_customer** model) extended with additional information about country and region (join statement with **dim_country_region**) for further processing.

{% enddocs %}

{% docs dim_supplier_country_region %}

The following model provides CTE for supplier table (from the **stg_supplier** model) extended with additional information about country and region (join statement with **dim_country_region**) for further processing.

{% enddocs %}

{% docs dim_partsupp_part %}

The following model provides CTE for joined **stg_partsupp** and **stg_part** tables for further processing.

{% enddocs %}

{% docs dim_supplier_partsupp_nation %}

The following model provides CTE for joined **stg_suppier**, **stg_partsupp** and **stg_nation** tables for further processing.

{% enddocs %}

{% docs fct_lineitem_part %}

The following model provides CTE for joined **stg_lineitem** and **stg_part** tables for further processing.

{% enddocs %}