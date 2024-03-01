# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Visits_34(
visit_id int, 
customer_id int
);

Create table If Not Exists Transactions_34(
transaction_id int, 
visit_id int, amount int
);

Truncate table Visits_34;

insert into Visits_34 (visit_id, customer_id) values ('1', '23');
insert into Visits_34 (visit_id, customer_id) values ('2', '9');
insert into Visits_34 (visit_id, customer_id) values ('4', '30');
insert into Visits_34 (visit_id, customer_id) values ('5', '54');
insert into Visits_34 (visit_id, customer_id) values ('6', '96');
insert into Visits_34 (visit_id, customer_id) values ('7', '54');
insert into Visits_34 (visit_id, customer_id) values ('8', '54');

Truncate table Transactions_34;

insert into Transactions_34 (transaction_id, visit_id, amount) values ('2', '5', '310');
insert into Transactions_34 (transaction_id, visit_id, amount) values ('3', '5', '300');
insert into Transactions_34 (transaction_id, visit_id, amount) values ('9', '5', '200');
insert into Transactions_34 (transaction_id, visit_id, amount) values ('12', '1', '910');
insert into Transactions_34 (transaction_id, visit_id, amount) values ('13', '2', '970');

/*
Q. Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
Return the result table sorted in any order.
The result format is in the following example.

Input: 
Visits
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+
Transactions
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+
Output: 
+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |
+-------------+----------------+
Explanation: 
Customer with id = 23 visited the mall once and made one transaction during the visit with id = 12.
Customer with id = 9 visited the mall once and made one transaction during the visit with id = 13.
Customer with id = 30 visited the mall once and did not make any transactions.
Customer with id = 54 visited the mall three times. During 2 visits they did not make any transactions, and during one visit they made 3 transactions.
Customer with id = 96 visited the mall once and did not make any transactions.
As we can see, users with IDs 30 and 96 visited the mall one time without making any transactions. Also, user 54 visited the mall twice and did not make any transactions.
*/

SELECT * FROM Visits_34;
SELECT * FROM Transactions_34;



SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans
FROM Visits_34 AS v
LEFT JOIN Transactions_34 AS t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id
ORDER BY COUNT(v.visit_id) DESC;
