
SELECT 
    z.zipcode, 
    COUNT(t.tree_id) AS tree_count
FROM 
    nyc_trees AS t
JOIN 
    nyc_zipcodes AS z ON ST_Contains(ST_Transform(z.geometry, 4326), t.geometry)
GROUP BY 
    z.zipcode
ORDER BY 
    tree_count DESC
LIMIT 10;
