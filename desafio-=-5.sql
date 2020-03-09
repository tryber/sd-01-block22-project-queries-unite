CREATE VIEW travel_package_info AS
  SELECT 
	(
		SELECT travel_packages_id
		FROM queries_unite.travel_packages
		WHERE queries_unite.purchases.travel_packages_id = queries_unite.travel_packages.travel_packages_id
	) as travel_packages_id,
	(
		SELECT package_name
		FROM queries_unite.travel_packages
		WHERE queries_unite.purchases.travel_packages_id = queries_unite.travel_packages.travel_packages_id
	) as travel_package_name,
	(
		SELECT users_id
		FROM queries_unite.travel_packages
		WHERE queries_unite.purchases.travel_packages_id = queries_unite.travel_packages.travel_packages_id
	) as user_id,
	(
		SELECT full_name
		FROM queries_unite.users
		WHERE queries_unite.purchases.users_id = queries_unite.users.id
	) as user_name,
	(
		SELECT package_price_total
		FROM queries_unite.travel_packages
		WHERE queries_unite.purchases.travel_packages_id = queries_unite.travel_packages.travel_packages_id
	) as cost
		FROM queries_unite.purchases
      ORDER BY 5;
  