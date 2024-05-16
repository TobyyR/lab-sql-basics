use bank;

SELECT client_id
FROM client
WHERE district_id = 1
ORDER BY client_id
LIMIT 5;


SELECT client_id
FROM client
WHERE district_id = 72
ORDER BY client_id DESC
LIMIT 1;

SELECT amount
FROM loan
ORDER BY amount
LIMIT 3;

SELECT DISTINCT status
FROM loan
ORDER BY status;

SELECT loan_id
FROM loan
ORDER BY payments DESC
LIMIT 1;

SELECT account_id, amount
FROM loan
ORDER BY account_id
LIMIT 5;

SELECT account_id
FROM loan
WHERE duration = 60
ORDER BY amount
LIMIT 5;

SELECT account_id
FROM loan
WHERE duration = 60
ORDER BY amount
LIMIT 5;

SELECT DISTINCT k_symbol
FROM `order`;

SELECT order_id
FROM `order`
WHERE account_id = 34;

SELECT DISTINCT account_id
FROM `order`
WHERE order_id BETWEEN 29540 AND 29560;

SELECT amount
FROM `order`
WHERE account_to = 30067122;

SELECT trans_id, date, type, amount
FROM trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10;

SELECT district_id, COUNT(*)
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id;

SELECT type, COUNT(*) AS count
FROM card
GROUP BY type
ORDER BY count DESC;

SELECT account_id, SUM(amount) AS total_amount
FROM loan
GROUP BY account_id
ORDER BY total_amount DESC
LIMIT 10;

SELECT date, COUNT(*) AS loan_count
FROM loan
WHERE date < 930907
GROUP BY date
ORDER BY date DESC;

SELECT date, duration, COUNT(*) AS loan_count
FROM loan
WHERE date BETWEEN 971201 AND 971231
GROUP BY date, duration
ORDER BY date, duration;

SELECT account_id, type, SUM(amount) AS total_amount
FROM trans
WHERE account_id = 396
GROUP BY type
ORDER BY type;

SELECT account_id,
       CASE
           WHEN type = 'PRIJEM' THEN 'INCOMING'
           WHEN type = 'VYDAJ' THEN 'OUTGOING'
       END AS transaction_type, 
       FLOOR(SUM(amount)) AS total_amount
FROM trans
WHERE account_id = 396
GROUP BY type
ORDER BY transaction_type;

SELECT account_id,
       SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END) AS incoming_amount,
       SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END) AS outgoing_amount,
       SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END) - SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END) AS difference
FROM trans
GROUP BY account_id
ORDER BY difference DESC
LIMIT 10;