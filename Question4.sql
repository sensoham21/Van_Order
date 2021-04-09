SELECT Total.Driver_ID AS Driver_ID,
       Orders.Total_Orders_Completed AS Total_Orders_Completed,
       Total.Total_Income AS Total_Income
FROM (SELECT vanI.servicer_auth AS Driver_ID,
             SUM(vanO.total_price) AS Total_Income
      FROM vaninterest AS vanI
      LEFT JOIN vanorder AS vanO
      ON vanI.idvanOrder = vanO.idvanOrder
      AND vanI.order_subset_assigned = vanO.order_subset
      AND vanI.servicer_auth = vanO.servicer_auth
      GROUP BY Driver_ID
      ORDER BY Driver_ID) AS Total 
LEFT JOIN (SELECT COUNT(*) AS Total_Orders_Completed,
                  servicer_auth AS Driver_ID
           FROM vanorder
           WHERE order_status = 2
           GROUP BY Driver_ID
           ORDER BY Driver_ID) AS Orders 
ON Total.Driver_ID = Orders.Driver_ID
ORDER BY Total_Income DESC, Total_Orders_Completed;