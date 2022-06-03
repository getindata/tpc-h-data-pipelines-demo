{% docs __audit_helper__ %}

### dbt-labs/audit_helper
The useful package with macros for performing data audits.

[Source](https://hub.getdbt.com/dbt-labs/audit_helper/0.5.0/)

{% enddocs %}
--------------------------------
{% docs __codegen__ %}

### dbt-labs/codegen
Macros that generate dbt code, and log it to the command line.

[Source](https://hub.getdbt.com/dbt-labs/codegen/latest/)

{% enddocs %}

--------------------------------
{% docs __dbt_date__ %}

### dbt-labs/dbt_date
Extension package for dbt to handle date logic and calendar functionality.

[Source](https://hub.getdbt.com/calogica/dbt_date/latest/)

{% enddocs %}

--------------------------------
{% docs __dbt_expectations__ %}

### catalogica/dbt_expectations
dbt-expectations is an extension package for dbt, inspired by the Great Expectations package for Python. The intent is to allow dbt users to deploy GE-like tests in their data warehouse directly from dbt, vs having to add another integration with their data warehouse.

[Source](https://hub.getdbt.com/calogica/dbt_expectations/latest/)

{% enddocs %}

--------------------------------
{% docs __dbt_profiler__ %}

### data-mie/dbt_profiler
dbt-profiler implements dbt macros for profiling database relations and creating doc blocks and table schemas (schema.yml) containing said profiles. A calculated profile contains the following measures for each column in a relation:

- column_name: Name of the column
- data_type: Data type of the column
- not_null_proportion: Proportion of column values that are not NULL (e.g., 0.62 means that 62% of the values are populated while 38% are NULL)
- distinct_proportion: Proportion of unique column values (e.g., 1 means that 100% of the values are unique)
- distinct_count: Count of unique column values
- is_unique: True if all column values are unique
- min: Minimum column value
- max: Maximum column value
- avg: Average column value
- std_dev_population: Population standard deviation
- std_dev_sample: Sample standard deviation
- profiled_at: Profile calculation date and time

[Source](https://hub.getdbt.com/data-mie/dbt_profiler/latest/)

{% enddocs %}

--------------------------------
{% docs __dbt_utils__ %}

### dbt-labs/dbt_utils
This dbt package contains macros that can be (re)used across dbt projects.

[Source](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/)

{% enddocs %}