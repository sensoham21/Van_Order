SELECT requestor_client_id AS Client, COUNT(requestor_client_id) AS Total_Orders_Completed, SUM(total_price) AS Total_Money_Spent
FROM vanorder
WHERE order_status = 2
GROUP BY requestor_client_id
ORDER BY Total_Money_Spent DESC, Total_Orders_Completed DESC;