WITH cte_1 AS (
    SELECT
        film_id,
        actor_id,
        count(film_id) films_made,
        rank() over (
            PARTITION by film_id
            ORDER BY
                count(film_id) DESC
        ) AS `rank`
    FROM
        film_actor
    GROUP BY
        actor_id
)
SELECT
    title,
    concat(first_name, ' ', last_name) AS actor,
    films_made
FROM
    cte_1 c
    JOIN actor a ON c.actor_id = a.actor_id
    JOIN film f ON c.film_id = f.film_id
WHERE
    `rank` = 1
LIMIT
    5;