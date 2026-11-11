# DDL → Data Definition Language

### Manipulação de Tabelas 

#### Criação

* Criação de tabela a partir de uma query
   ```SQL
    SELECT
    	customer_id,
    	datediff('years', birth_date, CURRENT_DATE) idade_cliente
    	INTO temp_tables.customers_age
    FROM sales.customers

    SELECT *
    FROM temp_tables.customers_age
    ```

* Criação de tabela a partir do zero
   ```SQL
    SELECT DISTINCT professional_status
    FROM sales.customers;

    CREATE TABLE temp_tables.profissoes (
    	professional_status VARCHAR NOT NULL,
    	status_profissional VARCHAR
    );

    INSERT INTO temp_tables.profissoes
    (professional_status, status_profissional);

    VALUES
    ('freelancer', 'freelancer'),
    ('retired', 'aposentado(a)'),
    ('clt', 'clt'),
    ('self_employed', 'autônomo(a)'),
    ('other', 'outro'),
    ('businessman', 'empresário(a)'),
    ('civil_servant', 'funcionário público(a)'),
    ('student', 'estudante');

    SELECT * FROM temp_tables.profissoes;
    ```

#### Deleção

 ```SQL
  DROP TABLE temp_tables.profissoes -- Realizar um backup antes
  ```

### Manipulação de Colunas

#### Inserção

 ```SQL
  -- Insira uma coluna na tabela sales.customers com a idade do cliente
  ALTER TABLE sales.customers
  ADD customer_age INT

  SELECT * FROM sales.customers LIMIT 10

  UPDATE sales.customers
  SET customer_age = DATEDIFF('years', birth_date, CURRENT_DATE)
  WHERE true
  ```

#### Atualização

 ```SQL
  -- Exemplo 1: Alteração do tipo da coluna
  -- Altere o tipo da coluna customer_age de inteiro para varchar
  ALTER TABLE sales.customers
  ALTER COLUMN customer_age TYPE VARCHAR

  SELECT * FROM sales.customers LIMIT 10

  -- Exemplo 2: Alteração do nome da coluna
  -- Renomeie o nome da coluna "customer_age" para "age"
  ALTER TABLE sales.customers
  RENAME COLUMN customer_age TO age

  SELECT * FROM sales.customers LIMIT 10
  ```

#### Deleção

 ```SQL
  ALTER TABLE sales.customers
  DROP COLUMN age
  ```
