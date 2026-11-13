# SQL

* Baseado no curso "SQL para Análise de Dados: Do básico ao avançado", de Midori Toyota (Udemy).
* Ambiente: PostgreSQL - pgAdmin 4

## Mapa

| Sigla | Significa                  | Comandos                                      | Arquivo                      |
| ----- | -------------------------- | --------------------------------------------- | ---------------------------- |
| DQL   | Data Query Language        | `SELECT`                                    | [notas/DQL.md](notas/dql.md)  |
| DDL   | Data Definition Language   | `CREATE`,`ALTER`,`DROP`                 | [notas/DDL.md](notas/ddl.md)  |
| DML   | Data Manipulation Language | `INSERT`,`UPDATE`,`DELETE`,`TRUNCATE` | [notas/DML.md](notas/sml.md)  |

## O que tem em cada arquivo

### DQL.md

* Funções de agregação: `COUNT`, `SUM`, `MIN`, `MAX`, `AVG`
* `GROUP BY` e `HAVING`
* Joins: left, inner, right e full
* `UNION` e `UNION ALL`
* Subqueries: em `WHERE`, `WITH`, `FROM` e `SELECT`
* Tratamento de dados
  * Conversão de unidades: `::` e `CAST`
  * Tratamento geral: `CASE WHEN` e `COALESCE`
  * Tratamento de texto: `LOWER`, `UPPER`, `TRIM`, `REPLACE`
  * Tratamento de datas: `INTERVAL`, `DATE_TRUNC`, `EXTRACT`, `DATEDIFF`

### DDL.md

* Funções: criar e apagar a função `datediff`
* Tabelas: criar (a partir de uma query e do zero) e apagar
* Colunas: adicionar, alterar tipo, renomear e apagar

### DML.md

* Linhas: inserir (`INSERT`), atualizar (`UPDATE`), deletar (`DELETE`) e esvaziar a tabela (`TRUNCATE`)

## Banco de dados

Os exemplos dos arquivos acima rodam sobre um banco próprio, com dois schemas:

* `sales`: tabelas do exemplo de vendas de veículos (clientes, lojas, produtos e funil de vendas)
* `temp_tables`: tabelas auxiliares criadas e alteradas nos exemplos de DDL e DML

Estrutura e dados estão juntos em database.sql. O modelo está em diagram.md.

Colunas que aparecem nos exemplos:

| Tabela                  | Colunas                                                                                                                                                                       |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `sales.funnel`        | `visit_id`,`customer_id`,`store_id`,`product_id`,`visit_page_date`,`add_to_cart_date`,`start_checkout_date`,`finish_checkout_date`,`paid_date`,`discount` |
| `sales.customers`     | `customer_id`,`state`,`professional_status`,`birth_date`,`income`                                                                                                   |
| `sales.products`      | `product_id`,`price`,`model_year`                                                                                                                                       |
| `sales.stores`        | `store_id`,`store_name`                                                                                                                                                   |
| `temp_tables.regions` | `population`                                                                                                                                                                |

A lista cobre só o que os exemplos usam. O esquema completo está no `database.sql`.

### Como montar o banco

1. No pgAdmin, crie um banco novo (botão direito em *Databases* → *Create* →  *Database* ).
2. Abra a *Query Tool* nesse banco.
3. Abra o arquivo `database/database.sql` e execute (F5).
4. Confira se os dados entraram: `SELECT COUNT(*) FROM sales.funnel;` deve retornar 30580.

## Estrutura da pasta

```
sql/
├── README.md
├── notas/
│   ├── DQL.md
│   ├── DDL.md
│   └── DML.md
└── database/
    ├── database.sql
    └── diagram.md
```
