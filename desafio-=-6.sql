-- CREATE VIEW amount_spent_by_user AS
SELECT 
  (
  SELECT users_id
  FROM queries_unite.travel_packages
  WHERE queries_unite.purchases.travel_packages_id = queries_unite.travel_packages.travel_packages_id
  group by users_id
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
  ) as amount
FROM queries_unite.purchases;