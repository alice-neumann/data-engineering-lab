# SQL
- Baseado no curso "SQL para Análise de Dados: Do básico ao avançado", de Midori Toyota (Udemy).

### Funções Agregadas

#### Funções de Agregação

* Count()
* Sum()
* Min()
* Max()
* Avg()

#### Group By

* Normalmente utilizado com funções de agregação, mas não necessariamente
  * ```SQL
    -- Sem as funções de agregação → funciona como um DISTINCT
    SELECT state FROM sales.customers
    GROUP BY state
    ```
* Group By +1 coluna:
  * ```SQL
    SELECT state, professional_status, COUNT(*) AS contagem
    FROM sales.customers
    GROUP BY state, professional_status
    ORDER BY state, contagem DESC
    ```

#### Having

* Filtra linhas de colunas agrupadas por funções de agregação e também colunas não agrupadas
  * ```SQL
    SELECT state, COUNT()
    FROM sales.customers
    GROUP BY state
    HAVING COUNT() > 100 AND state <> 'MG'
    ```

#### Joins

* Left Join  
  * ![left-join](../img/sql/left-join.png)
* Inner Join
  * ![inner-join](../img/sql/inner-join.png)
* Right Join
  * ![right-join](../img/sql/right-join.png)
* Full Join
  * ![full-join](../img/sql/full-join.png)

#### Unions

* Union

  * Remove linhas duplicadas (+ pesado)
* Union ALL

  * Não remove linhas duplicadas
  * ```SQL
    select * from sales.products
    ```

#### Subqueries

* WHERE

  * A subquerie deve retornar apenas um valor
  * Quando é preciso filtrar registros usando o resultado de outra consulta
  * ```SQL
    -- Informe qual é o veículo mais barato da tabela products
    SELECT * FROM sales.products
    WHERE price = (SELECT MIN(price) FROM sales.products)
    ```
* WITH

  * Organiza uma consulta em etapas nomeadas
  * ```SQL
    -- Calcule a idade média dos clientes por status profissional
    WITH status_e_idade AS (
    SELECT
    	professional_status,
    	(CURRENT_DATE - birth_date)/365 AS idade
    FROM sales.customers
    )
    SELECT
    	professional_status,
    	AVG(idade) AS idade_media
    FROM status_e_idade
    GROUP BY professional_status
    ```
* FROM

  * Aconselhável não utilizar, pois toda subquerie feita com FROM pode ser feita com WITH
  * Cria uma tabela derivada para consultar
  * ```SQL
    -- Calcule a média de idades dos clientes por status profissional
    SELECT
    	professional_status,
    	AVG(idade) AS idade_media
    FROM (
    		SELECT
    			professional_status,
    			(CURRENT_DATE - birth_date)/365 AS idade
    		FROM sales.customers
    	 ) as status_e_idade
    GROUP BY professional_status
    ```
* SELECT

  * A subquerie deve retornar apenas um valor
  * Calcula informações para cada registro
  * ```SQL
    -- Na tabela sales.funnel crie uma coluna que informe o nº de visitas acumuladas 
    -- que a loja visitada recebeu até o momento
    SELECT 
    	f.visit_id,
      	f.visit_page_date,
      	sto.store_name,
        (
    		SELECT COUNT(*)
      		FROM sales.funnel as f2
      		WHERE f2.visit_page_date <= f.visit_page_date
      			AND f2.store_id = f.store_id
        ) AS visitas_acumuladas

    FROM sales.funnel as f
    LEFT JOIN sales.stores as sto
    	ON f.store_id = sto.store_id
    ORDER BY sto.store_name, f.visit_page_date
    ```

#### Tratamento de Dados

#### Manipulação de Tabelas
