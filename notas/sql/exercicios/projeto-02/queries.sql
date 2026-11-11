-- (Query 1) Gênero dos leads
-- Colunas: gênero, leads(#)

-- SELECT * FROM sales.customers
-- SELECT * FROM sales.funnel
-- SELECT * FROM temp_tables.ibge_genders

SELECT  
	CASE
		WHEN ibge.gender = 'male' THEN 'homens'
		WHEN ibge.gender = 'female' THEN 'mulheres'
		END AS genero,
	COUNT(*) AS "leads (#)"
FROM temp_tables.ibge_genders AS ibge
	JOIN sales.customers AS c
		ON ibge.first_name = lower(c.first_name)
GROUP BY ibge.gender

-- (Query 2) Status profissional dos leads
-- Colunas: status profissional, leads (%)

-- SELECT * FROM sales.customers

SELECT 
	CASE
		WHEN c.professional_status = 'freelancer' THEN 'freelancer'
		WHEN c.professional_status = 'retired' THEN 'aposentado(a)'
		WHEN c.professional_status = 'clt' THEN 'clt'
		WHEN c.professional_status = 'self_employed' THEN 'autônomo(a)'
		WHEN c.professional_status = 'other' THEN 'outros'
		WHEN c.professional_status = 'businessman' THEN 'empresário(a)'
		WHEN c.professional_status = 'civil_servant' THEN 'funcinário(a) público(a)'
		WHEN c.professional_status = 'student' THEN 'estudante'
	END AS "status profissional",
	(COUNT(*)::FLOAT)/(SELECT COUNT(*) FROM sales.customers) AS "leads (%)"
FROM sales.customers AS c
GROUP BY c.professional_status
ORDER BY "leads (%)"

-- (Query 3) Faixa etária dos leads
-- Colunas: faixa etária, leads (%)

-- SELECT * FROM sales.customers

SELECT 
	CASE
		WHEN ((CURRENT_DATE - birth_date)/365) < 20 THEN '0-20'
		WHEN ((CURRENT_DATE - birth_date)/365) < 40 THEN '20-40'
		WHEN ((CURRENT_DATE - birth_date)/365) < 60 THEN '40-60'
		WHEN ((CURRENT_DATE - birth_date)/365) < 80 THEN '60-80'
		ELSE '80+'
	END AS "faixa etaria",
	(COUNT(*)::FLOAT)/(SELECT COUNT(*) FROM sales.customers) AS "leads (%)"
FROM sales.customers 
GROUP BY "faixa etaria"
ORDER BY "faixa etaria" DESC

-- (Query 4) Faixa salarial dos leads
-- Colunas: faixa salarial, leads (%), ordem

-- SELECT * FROM sales.customers

SELECT 
	CASE
		WHEN income < 5000 THEN '0-5.000'
		WHEN income < 10000 THEN '5.000-10.000'
		WHEN income < 15000 THEN '10.000-15.000'
		WHEN income < 20000 THEN '15.000-20.000'
		ELSE '20.000+'
	END AS "faixa salarial",
	CASE
		WHEN income < 5000 THEN 1
		WHEN income < 10000 THEN 2
		WHEN income < 15000 THEN 3
		WHEN income < 20000 THEN 4
		ELSE 5
	END AS ordem,
	(COUNT(*)::FLOAT)/(SELECT COUNT(*) FROM sales.customers) AS "leads (%)"
FROM sales.customers 
GROUP BY "faixa salarial", ordem
ORDER BY ordem DESC

-- (Query 5) Classificação dos veículos visitados
-- Colunas: classificação do veículo, veículos visitados (#)
-- Regra de negócio: Veículos novos tem até 2 anos e seminovos acima de 2 anos

-- SELECT * FROM sales.funnel
-- SELECT * FROM sales.products

SELECT
	CASE
		WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 2 THEN 'novo'
		ELSE 'seminovo'
	END AS "idade do veiculo",
	COUNT(*) as "veiculos visitados (#)"
FROM sales.products AS p
	LEFT JOIN sales.funnel AS f
		ON p.product_id = f.product_id
GROUP BY "idade do veiculo"

-- (Query 6) Idade dos veículos visitados
-- Colunas: Idade do veículo, veículos visitados (%), ordem

-- SELECT * FROM sales.funnel
-- SELECT * FROM sales.products

WITH idade_veiculos AS (
	SELECT
		CASE 
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 2 THEN 'até 2 anos'
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 4 THEN 'de 2 à 4 anos'
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 6 THEN 'de 4 à 6 anos'
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 8 THEN 'de 6 à 8 anos'
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 10 THEN 'de 8 à 10 anos'
			ELSE 'acima de 10 anos'
		END AS idades,
		CASE 
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 2 THEN 1
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 4 THEN 2
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 6 THEN 3
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 8 THEN 4
			WHEN (EXTRACT('year' FROM f.visit_page_date) - p.model_year::NUMERIC) <= 10 THEN 5
			ELSE 6
		END AS ordem
	FROM sales.funnel AS f
		JOIN sales.products AS p
			ON f.product_id = p.product_id
)

SELECT idades, (COUNT(*)::FLOAT)/(SELECT COUNT(*) FROM sales.funnel) AS "veiculos visitados (%)", ordem
FROM idade_veiculos
GROUP BY idades, ordem
ORDER BY ordem

-- (Query 7) Veículos mais visitados por marca
-- Colunas: brand, model, visitas (#)

-- SELECT * FROM sales.funnel
-- SELECT * FROM sales.products

SELECT p.brand AS marca, p.model AS modelo, COUNT(f.visit_page_date) AS "visitas (#)"
FROM sales.products AS p
	JOIN sales.funnel AS f
		ON p.product_id = f.product_id
GROUP BY p.brand, p.model
ORDER BY p.brand, p.model