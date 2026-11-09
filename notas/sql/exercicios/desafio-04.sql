-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
SELECT p.brand, COUNT(*) AS visitas
FROM sales.funnel AS f 
	JOIN sales.products AS p
		ON f.product_id = p.product_id
GROUP BY p.brand
ORDER BY visitas DESC

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
SELECT s.store_name, COUNT(*) AS visitas
FROM sales.stores AS s
	LEFT JOIN sales.funnel AS f
		ON s.store_id = f.store_id
GROUP BY s.store_name
ORDER BY visitas DESC

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
SELECT r.size, COUNT(*) as qtd
FROM sales.customers AS c
	JOIN temp_tables.regions AS r
		ON lower(c.city) = lower(r.city)
		AND lower(c.state) = lower(r.state)
GROUP BY r.size
ORDER BY r.size DESC