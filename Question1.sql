SELECT DATE_FORMAT(order_datetime, '%H') AS Hour_of_day,
       COUNT(idvanOrder) AS Count_of_order
FROM vanorder
GROUP BY Hour_of_day
ORDER BY Hour_of_day;