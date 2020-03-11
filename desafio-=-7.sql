CREATE VIEW top_3_locations AS
SELECT 
l.location_id,
l.city,
l.country,
count(tpl.location_id) as travel_amount
FROM queries_unite.purchases AS p
INNER JOIN queries_unite.travel_packages_locations AS tpl
ON p.travel_packages_id = tpl.travel_packages_id
INNER JOIN queries_unite.locations AS l
ON l.location_id = tpl.location_id
group by l.location_id
order by 4 desc
limit 3;
