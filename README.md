This repository demonstrates a common SQL error related to the use of aggregate functions (`AVG` in this case) and the `GROUP BY` clause.  The error arises from improperly including columns in the `SELECT` statement that are not part of the `GROUP BY` clause and are not aggregated.

The `bug.sql` file contains the incorrect query, while `bugSolution.sql` shows the correct ways to handle this situation, providing two options depending on whether you need to consider the order date in the average calculation.

This example highlights the importance of understanding how SQL handles grouping and aggregation to avoid unexpected query behavior or errors.