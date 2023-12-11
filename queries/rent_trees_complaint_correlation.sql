
WITH AvgRent AS (
    SELECT 
        r.regionname AS zipcode, 
        COALESCE(
            AVG(CAST(r."2023_01_31" AS DECIMAL)),
            0
        ) AS average_rent    
    FROM 
        nyc_historical_average_rents AS r
    GROUP BY 
        r.regionname
)
SELECT 
    ar.zipcode,
    TO_CHAR(ar.average_rent, 'FM9,999,999.99') AS formatted_average_rent,
    COUNT(t.tree_id) AS tree_count,
    COUNT(c.unique_key) AS complaint_count
FROM 
    AvgRent AS ar
JOIN 
    nyc_trees AS t ON t.zipcode::TEXT = ar.zipcode::TEXT
JOIN 
    nyc_311 AS c ON ar.zipcode::TEXT = c.incident_zip::TEXT
GROUP BY 
    ar.zipcode, ar.average_rent
ORDER BY 
    ar.average_rent DESC
LIMIT 5;
