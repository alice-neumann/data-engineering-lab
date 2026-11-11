# DML → Data Manipulation Language

### Manipulação de Linhas

#### Inserção

 ```SQL
  -- Insira os status 'desempregado(a)' e 'estagiário(a)' na temp_table.profissoes

  CREATE TABLE temp_tables.profissoes (
  	professional_status varchar,
  	status_profissional varchar
  );

  INSERT INTO temp_tables.profissoes
  (professional_status, status_profissional)

  VALUES
  ('freelancer', 'freelancer'),
  ('retired', 'aposentado(a)'),
  ('clt', 'clt'),
  ('self_employed', 'autônomo(a)'),
  ('other', 'outro'),
  ('businessman', 'empresário(a)'),
  ('civil_servant', 'funcionário público(a)'),
  ('student', 'estudante')

  SELECT * FROM temp_tables.profissoes

  INSERT INTO temp_tables.profissoes
  (professional_status, status_profissional)

  VALUES
  ('unemployed', 'desempregado(a)'),
  ('trainee', 'estagiario(a)')
  ```

#### Atualização

 ```SQL
  -- Corrija a tradução de 'estagiário(a)' de 'trainee' para 'intern' 
  UPDATE temp_tables.profissoes
  SET professional_status = 'intern'
  WHERE status_profissional = 'estagiario(a)'

  SELECT * FROM temp_tables.profissoes
  ```

#### Deleção

 ```SQL
  -- Delete as linhas dos status 'desempregado(a)' e 'estagiário(a)'

  DELETE FROM temp_tables.profissoes
  WHERE status_profissional = 'desempregado(a)'
  OR status_profissional = 'estagiario(a)'

  SELECT * FROM temp_tables.profissoes
  ```
 ```SQL
  -- Apaga todas as linhas de uma tabela de uma só vez, matendo a estrutura

  TRUNCATE TABLE temp_tables.profissoes
  ```
