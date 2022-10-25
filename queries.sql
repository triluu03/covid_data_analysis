-- Select the total_cases and total_deaths from each country
-- until the latest date recorded
SELECT 
	iso_code,
	location,
	MAX(total_cases) as total_cases,
	MAX(total_deaths) as total_deaths
FROM original_data
WHERE length(iso_code) <= 3
GROUP BY 
	iso_code,
	location;