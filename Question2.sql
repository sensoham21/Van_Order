SELECT price_group.Order_Complete_Group, (SUM(price_group.price)/(SELECT SUM(total_price) FROM vanorder WHERE order_status = 2))*100 AS Percentage_Price
FROM (SELECT SUM(total_price) AS price,
             requestor_client_id,
             CASE WHEN COUNT(requestor_client_id) = 1 THEN 'One'
                  ELSE 'More Than One' END AS Order_Complete_Group
      FROM vanorder
      WHERE order_status = 2
      GROUP BY requestor_client_id) AS price_group
GROUP BY price_group.Order_Complete_Group;