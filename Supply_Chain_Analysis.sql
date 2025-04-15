SELECT * FROM sandhyaapna.supply_chain_extended_data;
SELECT 
    warehouse_id,
    AVG(shipping_time_days) AS avg_shipping_time
FROM 
    supply_chain_data
GROUP BY 
    warehouse_id
ORDER BY 
    avg_shipping_time DESC;



SELECT 
    warehouse_id,
    SUM(current_stock) AS total_stock,
    SUM(demand_forecast) AS total_demand,
    SUM(current_stock) - SUM(demand_forecast) AS stock_difference
FROM 
    supply_chain_data
GROUP BY 
    warehouse_id
ORDER BY 
    stock_difference DESC;


SELECT 
    Warehouse_ID,
    Location,
    AVG(Lead_Time_Days) AS Avg_Lead_Time,
    AVG(Shipping_Time_Days) AS Avg_Shipping_Time,
    AVG(Order_Processing_Time) AS Avg_Processing_Time,
    AVG(Lead_Time_Days + Shipping_Time_Days + Order_Processing_Time) AS Total_Delay
FROM 
    supply_chain_extended_data
GROUP BY 
    Warehouse_ID, Location
ORDER BY 
    Total_Delay DESC
LIMIT 10;


-- Top 5 understocked warehouses
SELECT 
    Warehouse_ID,
    Location,
    Current_Stock,
    Demand_Forecast,
    (Current_Stock - Demand_Forecast) AS Stock_Gap
FROM 
    supply_chain_extended_data
ORDER BY 
    Stock_Gap ASC
LIMIT 5;

-- Top 5 overstocked warehouses
SELECT 
    Warehouse_ID,
    Location,
    Current_Stock,
    Demand_Forecast,
    (Current_Stock - Demand_Forecast) AS Stock_Gap
FROM 
    supply_chain_extended_data
ORDER BY 
    Stock_Gap DESC
LIMIT 5;




-- Top 5 most profitable records
SELECT 
    Warehouse_ID,
    Location,
    Monthly_Sales,
    Operational_Cost,
    Storage_Cost,
    Transportation_Cost,
    (Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) AS Profitability
FROM 
    supply_chain_extended_data
ORDER BY 
    Profitability DESC
LIMIT 5;

-- Top 5 least profitable records
SELECT 
    Warehouse_ID,
    Location,
    Monthly_Sales,
    Operational_Cost,
    Storage_Cost,
    Transportation_Cost,
    (Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) AS Profitability
FROM 
    supply_chain_extended_data
ORDER BY 
    Profitability ASC
LIMIT 5;
-- Average Delivery Metrics
SELECT 
    AVG(Lead_Time_Days) AS Avg_Lead_Time,
    AVG(Shipping_Time_Days) AS Avg_Shipping_Time,
    AVG(Order_Processing_Time) AS Avg_Processing_Time,
    AVG(Lead_Time_Days + Shipping_Time_Days + Order_Processing_Time) AS Avg_Total_Delay
FROM 
    supply_chain_extended_data;
-- Inventory Overview

SELECT 
    AVG(Current_Stock) AS Avg_Stock,
    SUM(Current_Stock) AS Total_Stock,
    AVG(Demand_Forecast) AS Avg_Demand,
    SUM(Demand_Forecast) AS Total_Demand
FROM 
    supply_chain_extended_data;


-- Average Stock Gap
SELECT 
    AVG(Current_Stock - Demand_Forecast) AS Avg_Stock_Gap,
    MIN(Current_Stock - Demand_Forecast) AS Min_Stock_Gap,
    MAX(Current_Stock - Demand_Forecast) AS Max_Stock_Gap
FROM 
    supply_chain_extended_data;


-- Forecast Accuracy Summary
SELECT 
    AVG(Demand_Forecast - Monthly_Sales) AS Avg_Forecast_Error,
    MIN(Demand_Forecast - Monthly_Sales) AS Min_Forecast_Error,
    MAX(Demand_Forecast - Monthly_Sales) AS Max_Forecast_Error
FROM 
    supply_chain_extended_data;


-- Profitability Summary

SELECT 
    AVG(Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) AS Avg_Profitability,
    MIN(Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) AS Min_Profitability,
    MAX(Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) AS Max_Profitability,
    SUM(Monthly_Sales) AS Total_Revenue,
    SUM(Operational_Cost + Storage_Cost + Transportation_Cost) AS Total_Cost
FROM 
    supply_chain_extended_data;
    
    


