
SELECT zipcode, COUNT(*) AS tree_count FROM nyc_trees
GROUP BY zipcode
ORDER BY tree_count DESC
LIMIT 10;
