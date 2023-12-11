
SELECT 
    t.zipcode, 
    TO_CHAR(AVG(CAST(r."2023_08_31" AS DECIMAL)), 'FM9,999,999.99') AS average_rent
FROM 
    nyc_trees AS t
JOIN 
    nyc_historical_average_rents AS r ON t.zipcode::TEXT = r.regionname::TEXT
GROUP BY 
    t.zipcode
ORDER BY 
    COUNT(t.tree_id) DESC
LIMIT 10;
