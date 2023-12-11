
SELECT incident_zip AS zip_code, COUNT(*) AS complaint_count FROM nyc_311
GROUP BY incident_zip
ORDER BY complaint_count DESC;

