-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers
WITH num_visitas AS (
	SELECT customer_id, COUNT(*) as n_visitas
	FROM sales.funnel
	GROUP BY customer_id
)

SELECT c.*, n_visitas
FROM sales.customers as c
LEFT JOIN num_visitas
	ON c.customer_id = num_visitas.customer_id