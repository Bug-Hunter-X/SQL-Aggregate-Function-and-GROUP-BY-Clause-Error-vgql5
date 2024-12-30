The error lies in the original query's attempt to include `order_date` in the `SELECT` list without including it in the `GROUP BY` clause.  SQL requires that all non-aggregated columns be included in the `GROUP BY` or removed. Here are two corrected versions:

```sql
-- Option 1: Average order total per customer per date
SELECT customer_id, AVG(order_total) AS average_order_total, order_date FROM orders GROUP BY customer_id, order_date;

-- Option 2: Average order total per customer (ignoring date)
SELECT customer_id, AVG(order_total) AS average_order_total FROM orders GROUP BY customer_id;
```

Option 1 provides the average order total for each customer on each date. Option 2 provides the overall average order total for each customer, ignoring the order date.