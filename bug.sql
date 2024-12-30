In SQL, a common yet subtle error arises when dealing with aggregate functions and `GROUP BY` clauses.  Consider this scenario: you have a table named `orders` with columns `customer_id`, `order_total`, and `order_date`. You want to find the average order total for each customer. A seemingly correct query might be:

```sql
SELECT customer_id, AVG(order_total) AS average_order_total, order_date FROM orders GROUP BY customer_id;
```

However, this will likely result in an error or unpredictable behavior. The issue is that `order_date` is not included in the `GROUP BY` clause.  SQL databases are strict about this; all columns in the `SELECT` list that are not aggregated must be part of the `GROUP BY` clause. The database doesn't know which `order_date` to associate with the average `order_total` for a given customer. This leads to an error in many systems, or non-deterministic results in others.  The correct query should either include `order_date` in the `GROUP BY` (if you need a separate average for each customer on each date), or remove it entirely (if you only need a single average per customer regardless of date):

```sql
-- Option 1: Average order total per customer per date
SELECT customer_id, AVG(order_total) AS average_order_total, order_date FROM orders GROUP BY customer_id, order_date;

-- Option 2: Average order total per customer (ignoring date)
SELECT customer_id, AVG(order_total) AS average_order_total FROM orders GROUP BY customer_id;
```