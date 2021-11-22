-- Write a query to find customers with more than 1,000 points and add an index to that column

EXPLAIN SELECT customer_id 
FROM customers
WHERE points > 1000; 
;

CREATE INDEX idx_points ON customers (points);