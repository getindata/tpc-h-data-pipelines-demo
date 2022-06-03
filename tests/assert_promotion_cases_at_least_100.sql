-- There should be at least 100 promotion cases in total at all times

WITH calculate_promotion_cases_count AS (
    SELECT
      COUNT(DISTINCT part_type) AS promotion_cases_count
    FROM
      {{ ref('fct_lineitem_part_promotion_cases_for_Q14') }}
)
SELECT
  *
FROM
  calculate_promotion_cases_count
WHERE
  promotion_cases_count < 100
