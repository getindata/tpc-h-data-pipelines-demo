{% docs dashboard_demo %}

Demonstrative report based on the dbt models is created using Google Data Studio. The dashboard provides general business intelligence analytics (like number of active customers, number of total customers, orders placed / shipped and returned as well as their ratios), but also shares vision of how projects presentation layer can by utilized in order to retrieve desired information. The logic behind the following business querries provided in the TPC-H documentation has been used:

- Minimum Cost Supplier Query Q2

From TPC-H documentation: "This query finds which supplier should be selected to place an order for a given part in a given region.
The Minimum Cost Supplier Query finds, in a given region, for each part of a certain type and size, the supplier who can supply it at minimum cost. If several suppliers in that region offer the desired part type and size at the same (minimum) cost, the query lists the parts from suppliers with the 100 highest account balances. For each supplier, the query lists the supplier's account balance, name and nation; the part's number and manufacturer; the supplier's address, phone number and comment information."

In the interactive dashboard, the viewer can follow the results of referential search criteria given by the tpch documentation (part type - "brass", region - Europe, size - 15) or can use his/hers own boundary conditions by modifying the part type, its size range, supplier region or country for his own research.

- Volume Shipping Query Q7

From TPC-H documentation: "This query determines the value of goods shipped between certain nations to help in the re-negotiation of shipping contracts.
The Volume Shipping Query finds, for two given nations, the gross discounted revenues derived from lineitems in which parts were shipped from a supplier in either nation to a customer in the other nation during 1995 and 1996. The query lists the supplier nation, the customer nation, the year, and the revenue from shipments that took place in
that year. The query orders the answer by Supplier nation, Customer nation, and year (all ascending)."

In the interactive dashboard, the viewer can follow the results of referential search criteria given by the tpch documentation (supplier country - France, customer country - Germany, year: 1995), or can pick different country pair and time period (including country internal shipping). The viewer is also provided with graph illustrating the discounted revenue running total and the pie chart demonstrating customers market share in the total discounted revenue for the specific search.

- Top Supplier Querry Q15

From TPC-H documentation: "This query determines the top supplier so it can be rewarded, given more business, or identified for special recognition.
The Top Supplier Query finds the supplier who contributed the most to the overall revenue for parts shipped during a given quarter of a given year. In case of a tie, the query lists all suppliers whose contribution was equal to the maximum, presented in supplier number order."

In the interactive dashboard, the viewer can track the supplier who contributed the most to the overall revenue in a given time period (or periods, the quarter has been used here), region and country. Also, he can preview how many times the given supplier has been on the top of the list (using the specified time period) and won the title of the "Supplier of the quarter" - an imaginary reward for the supplier with the best metrics.

## Resources:

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- About [Google Data Studio](https://datastudio.withgoogle.com/)

{% enddocs %}