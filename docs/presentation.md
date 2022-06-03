{% docs dim_customer_without_orders_for_Q22 %}

The model provides processed data for identification of geographies where there are customers
who may have be likely to make a purchase - question no. Q22 from the tpch documentation (pp. 66).
The resulting table is a list of customers, who have never placed any order.

{% enddocs %}

{% docs dim_global_sales_opportunity_query_Q22 %}

### The final query for dim_customer_without_orders_for_Q22.

The model provides processed data for identification of geographies where there are customers
who may have be likely to make a purchase - question no. Q22 from the tpch documentation (pp. 66).
The resulting table is a list of customers who have never placed any order and have positive accout balance. Selected country codes: **13, 31, 23,29, 30, 18 and 17**.

{% enddocs %}

{% docs customer_id %}

Unique customers id number.

{% enddocs %}

{% docs customer_phone %}

Customers declared phone number in a XX-XXX-XXX-XXXX format, where X - stands for an integer in the range between 0 and 9.

{% enddocs %}

{% docs customer_account %}

Customers account balance in $.

{% enddocs %}

{% docs customer_region %}

Name of the region stated by the customer.

{% enddocs %}

{% docs customer_country %}

Name of the country stated by the customer.

{% enddocs %}

{% docs dim_important_stock_identification_for_Q11 %}

The model provides processed data for identification of the most important subset of the suppliers` stock
in a given nation. The citeria of the significance has been provided by the client (min 0.1 % of the total value).
You can use this model to display the part number and the value of the parts that fulfill the criteria above.

{% enddocs %}

{% docs dim_important_stock_identification_Q11 %}

### The final query for dim_important_stock_identification_Q11.

The model provides processed data for identification of the most important subset of the suppliers` stock
in **Germany**. The citeria of the significance has been provided by the client (min 0.1 % of the total value).


{% enddocs %}

{% docs part_id %}

The unique part number stored in stg_part table.

{% enddocs %}

{% docs supplier_country %}

Name of the country stated by the supplier.

{% enddocs %}

{% docs discrete_value %}

The product of **partsupp_supply_cost**[add_link] and **partsupp_available_quantity**[add_link] from a **stg_supplier** model.
This value comes from the intermediate model **dim_supplier_partsupp_nation**[add_link]

{% enddocs %}

{% docs discrete_value_sum_over_part_and_country %}

The sum of the discrete_value grouped by part id and country.

{% enddocs %}

{% docs dim_minimum_cost_supplier_general_query_for_Q2 %}

The model provides the processed data for identification of supplier who should be selected to place an order for a given part in a given region. The searching criteria is the **lowest price** of the item of a given **part number**. You can use this model if you want to focus on the specific manufacturer, region, country or part type.

{% enddocs %}

{% docs dim_minimum_cost_supplier_query_Q2 %}

### The final query for dim_minimum_cost_supplier_query_Q2.

The model provides the data for identification of supplier who should be selected to place and order for a given part in a given region. The searching criteria is the **lowest price** of the item of a given **part number**. The search has been commited for the following criteria:
- size: 15
- type: brass
- region: Europe

{% enddocs %}

{% docs supplier_account %}

Suppliers account balance in $.

{% enddocs %}

{% docs supplier_name %}

Name of the supplier.

{% enddocs %}

{% docs supplier_region %}

Name of the region stated by the supplier.

{% enddocs %}

{% docs part_size %}

Size of the part of a given id number. The size is in the range between 1 and 50.

{% enddocs %}

{% docs part_type %}

Description on the type of the part for the given id number.

{% enddocs %}

{% docs partsupp_supply_cost %}

The supply cost of a given part by a given supplier.

{% enddocs %}

{% docs partsupp_available_quantity %}

The amount of parts of a given id stored by the given supplier.

{% enddocs %}

{% docs part_manufacturer %}

Manufacturer of the part for the given id number.

{% enddocs %}

{% docs supplier_address %}

Address of the supplier.

{% enddocs %}

{% docs supplier_phone %}

Supplier declared phone number in a XX-XXX-XXX-XXXX format, where X - stands for an integer in the range between 0 and 9.

{% enddocs %}

{% docs supplier_comment %}

Short notes and comments about the given supplier.

{% enddocs %}

{% docs min_supp_cost %}

The minimum supply cost for a given part id partitioned by region and part size.

{% enddocs %}

{% docs dim_parts_supplier_relationship_query_for_Q16 %}

The model provides the processed data for counting the suppliers who can supply items satysfaying various customer's requirements - part size, type, brand. The data is limited to suppliers who has not had complaints registered by the customer service.

{% enddocs %}

{% docs dim_parts_supplier_relationship_query_Q16 %}

### The final query for dim_parts_supplier_relationship_query_Q16.

The model provides the processed data for counting the suppliers who can supply items satysfaying the following requirements:

- Brand: every brand except the brand#45
- Type of the parts: medium polished
- Defined sizes: 49, 14, 23, 45, 19, 3, 36, 9.

The data is limited to suppliers who has not had complaints registered by the customer service.

{% enddocs %}

{% docs part_brand %}

The brand name for the part of the given ID.

{% enddocs %}

{% docs supplier_cnt %}

The number of suppliers who can supply items satyrsfying given requirements.

{% enddocs %}

{% docs fct_customer_orders_lineitem_for_Q3 %}

The model provides the processed data for detecting unshipped orders with the highest value (The shipping priority query Q3 from the documentation).

Additionally. The resulting table serves as the intermediate layer for following models:
- fct_shipping_for_Q7
- fct_shipping_models_and_order_priority_general_for_Q12

{% enddocs %}

{% docs fct_shipping_priority_query_Q3 %}

The model provides the data for detecting unshipped orders with highest value in **building** market segment for a date of **1995-03-15**.

{% enddocs %}

{% docs lineitem_row_id %}

Row id number created for partitioning and incremental materialization.

{% enddocs %}

{% docs order_id %}

Unique number of the customers order.

{% enddocs %}

{% docs lineitem_volume %}

The extended price of the part including the discount provided by the seller (source: **stg_lineitem**).
The forumla: **lineitem_extended_price** * (1 - * **lineitem_discount**).

{% enddocs %}

{% docs revenue %}

The sum of the **lineitem_volume** from the fct_customer_orders_lineitem_for_Q3 model.

{% enddocs %}

{% docs order_date %}

The date the order has been placed.

{% enddocs %}

{% docs orders_ship_priority %}

Priority of the shipment (do not mistake with priority of the order).

{% enddocs %}

{% docs customer_market_segment %}

Market segment represented by the customer (automobile, building, furniture, household, machinery).

{% enddocs %}

{% docs lineitem_ship_date %}

The shipping date for a given order.

{% enddocs %}

{% docs lineitem_ship_mode %}

The shipping method chosen for the given order and part. One of the following methods can be utilized:
AIR, SHIP, RAIL, MAIL, REG AIR, TRUCK, FOB.

{% enddocs %}

{% docs lineitem_commit_date %}

The orders commitment date.

{% enddocs %}

{% docs order_priority %}

The priority of the order provided by the seller. The order priority is limited to following options:
'1-URGENT', '2-HIGH', '3-MEDIUM', '4-NOT SPECIFIED', '5-LOW'

{% enddocs %}

{% docs lineitem_year %}

The year of a transaction based on the shipping date.

{% enddocs %}

{% docs lineitem_supplier_id %}

Unique id number of the supplier.

{% enddocs %}

{% docs lineitem_discount %}

The discount ration provided by the seller. 

{% enddocs %}

{% docs lineitem_extended_price %}

The net price for an item provided by the seller. 

{% enddocs %}

{% docs lineitem_line_id %}

Unique lineitem id number.

{% enddocs %}

{% docs fct_lineitem_part_promotion_cases_for_Q14 %}

The model provides the processed data for monitoring the market response to a promotions (such as TV advertisements or a special campaign). 

{% enddocs %}

{% docs fct_lineitem_part_promotion_cases_Q14 %}

### The final query for fct_lineitem_part_promotion_cases_Q14.

The model returns percentage value of the total revenue that was derived from parts subjected to promotion in **September 1995**.

{% enddocs %}

{% docs promo_revenue %}

The percentage of the revenue that was derived from promotional parts.

{% enddocs %}

{% docs is_promo %}

The marker that filters out the values of the parts that are not subjected to any promotions (the values represent in the columns are **lineitem_volume**). 

{% enddocs %}

{% docs fct_shipping_for_Q7 %}

The model provides processed data for investigating of the total value of goods shipped between two certain nations for a given time period (year).

{% enddocs %}

{% docs fct_volume_shipping_query_Q7 %}

### The final query for fct_shipping_for_Q7.
The model provides processed data for investigating of the total value of goods shipped between **France** and **Germany** in **1995** and **1996**.

{% enddocs %}

{% docs fct_shipping_modes_and_order_priority_general_for_Q12 %}

The model provides processed data for studying the effect of different shipping modes on critical-priority orders processing effectivenes in a given time period. In particular it determines whether selecting less expensive modes of shipping is negatively affecting the critical-priority orders by causing more parts to be received by customers after the committed date.

The Shipping Modes and Order Priority Query counts, by ship mode, for lineitems actually received by customers in a given year, the number of lineitems belonging to orders for which the receipt date exceeds the commit date for two different specified ship modes. Only lineitems that were actually shipped before the commit date are considered. The late lineitems are partitioned into two groups, those with priority URGENT or HIGH, and those with a priority other than URGENT or HIGH.

{% enddocs %}

{% docs fct_shipping_modes_and_order_priority_Q12 %}

### The final query for fct_shipping_modes_and_order_priority_general_for_Q12.

The model provides data for study the effect of different shipping modes on critical-priority orders in a given time period. In particular it determines whether selecting less expensive modes of shipping is negatively affecting the critical-priority orders by causing more parts to be received by customers after the committed date. The search in this model is narrowed only to **January 1994** and two shipping modes: **mail** and **ship**.

{% enddocs %}


{% docs lineitem_receipt_date %}

Receipt date for the the given order.

{% enddocs %}

{% docs high_line %}

The marker puts a filter mask "1" on the orders having priority of "Urgent" or "High".

{% enddocs %}

{% docs low_line %}

The marker puts a filter mask "1" on the orders having priority of **other than** "Urgent" or "High".

{% enddocs %}

{% docs high_line_count %}

Number of orders having priority of "Urgent" or "High"

{% enddocs %}

{% docs low_line_count %}

Number of orders having priority **other than** "Urgent" or "High".

{% enddocs %}

{% docs fct_top_supplier_general_querry_Q15 %}

The model provides processed data for determining the top supplier. The query finds the supplier who contributed the most to the overall revenue for parts shipped during a given quarter of a given year.

{% enddocs %}

{% docs fct_top_supplier_querry_Q15 %}

### The final query for fct_top_supplier_querry_Q15.

The model provides processed data for determining the top supplier in **the 1st quart of the 1996**.

The query finds the supplier who contributed the most to the overall revenue for parts shipped during a given quarter of a given year.

{% enddocs %}

{% docs total_revenue %}

Sum of the lineitem volume column, partitioned by supplier and time period (quart). The partitioning is provided for further time-series exploration.

{% enddocs %}

{% docs max_total_revenue %}

The maximum value of the total_revenue partitioned over time period (quart). The partitioning is provided for further time-series exploration.

{% enddocs %}

{% docs supplier_id %}

The unique number of the supplier.

{% enddocs %}


{% docs cntrycode %}

Country code column. The country code is the two first numbers of the customer's phone number

{% enddocs %}

{% docs numcust %}

Number of customers.

{% enddocs %}

{% docs totacctbal %}

Sum of customers account ballance.

{% enddocs %}