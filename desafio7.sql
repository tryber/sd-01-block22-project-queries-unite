USE queries_unite;
CREATE VIEW top_3_locations AS
SELECT
    l.location_id as id,
    l.city as city,
    l.country as country,
    count(tpl.location_id) as travel_amount
FROM queries_unite.purchases p
INNER JOIN queries_unite.travel_packages_locations tpl
ON tpl.travel_package_id = p.travel_package_id
INNER JOIN queries_unite.locations l
ON l.location_id = tpl.location_id
group by tpl.location_id
order by travel_amount DESC, id ASC
LIMIT 3;

SELECT * FROM top_3_locations;
