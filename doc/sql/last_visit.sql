SELECT
    users.id as user_id,
    restaurants.id as restaurant_id,
    MAX(lunches.date) as last_visit_date
FROM
    users
INNER JOIN
    users_lunches ranked_users_lunches
ON
    ranked_users_lunches.user_id = users.id
INNER JOIN
    lunches ranked_lunch
ON
    ranked_users_lunches.lunch_id = ranked_lunch.id
INNER JOIN
    users_lunches
ON
    users.id = users_lunches.user_id
INNER JOIN
    lunches
ON
    users_lunches.lunch_id = lunches.id
-- This join is necessary to rid us of lunches that don't correspond to a restuarant
INNER JOIN
    restaurants
ON
    lunches.restaurant_id = restaurants.id
WHERE
    TRUE -- ranked_lunches.id = blah
GROUP BY
    users.id,
    restaurants.id
