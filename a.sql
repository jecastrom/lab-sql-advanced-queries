WITH cte_1 AS(
    SELECT
        a.actor_id,
        a.first_name,
        a.last_name,
        fa.film_id,
        f.title
    FROM
        actor a
        INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
        INNER JOIN film f ON fa.film_id = f.film_id
)
SELECT
    DISTINCT concat(t1.first_name, ' ', t1.last_name) AS actor_1,
    concat(t2.first_name, ' ', t2.last_name) AS actor_2,
    t1.title shared_film
FROM
    cte_1 t1
    JOIN cte_1 t2 ON t1.film_id = t2.film_id
    AND t1.actor_id > t2.actor_id
LIMIT
    5;