

# AI-Driven Data Engineering - notas de estudo
Estudos e prática do bootcamp AI-Driven Data Engineering (AI/R Fellowship): Linux, Git, SQL, Python e ETL.

## Temas

| Tema             | Onde está                                    |
| ---------------- | --------------------------------------------- |
| SQL (PostgreSQL) | [notas/sql](notas/sql/README.md)               |
| Git e GitHub     | [notas/git-e-github.md](notas/git-e-github.md) |
| Linux            | [notas/linux.md](notas/linux.md)               |
| Copilot          | [notas/copilot.md](notas/copilot.md)           |

## SQL

O diretório de SQL é divido em três partes:

- **Notas:** anotações de DQL, DDL e DML, em [dql.md](notas/sql/notas/dql.md), [ddl.md](notas/sql/notas/ddl.md) e [dml.md](notas/sql/notas/dml.md).
- **Banco de dados:** o banco usado nos exemplos, com o script de criação e os dados em [database.sql](notas/sql/database/database.sql) e o modelo em [diagrama.svg](notas/sql/database/diagrama.svg).
- **Exercícios:** [desafios](notas/sql/exercicios/desafios), [projeto-01](notas/sql/exercicios/projeto-01) e [projeto-02](notas/sql/exercicios/projeto-02).

## Estrutura do repositório

```
├── README.md
├── .gitignore
└── notas/
    ├── img/                            # imagens usadas nas notas
    │   ├── sql/                        # imagens das notas de SQL
    │   ├── file-lifecycle.png
    │   ├── git-flow.png
    │   └── workflow.png
    ├── sql/
    │   ├── README.md                   # índice do SQL
    │   ├── database/                   # banco usado nos exemplos
    │   │   ├── database.sql            # estrutura e dados 
    │   │   └── diagrama.svg            # diagrama do banco
    │   ├── exercicios/                 # exercícios de SQL
    │   │   ├── desafios/
    │   │   ├── projeto-01/
    │   │   └── projeto-02/
    │   └── notas/                      # notas de SQL por tipo de comando
    │       ├── ddl.md
    │       ├── dml.md
    │       └── dql.md
    ├── copilot.md                      # anotações sobre Copilot
    ├── git-e-github.md                 # anotações sobre Git e GitHub
    └── linux.md                        # anotações sobre Linux
```

As imagens usadas nas notas ficam em `notas/img/`, com uma subpasta `sql/` para as de SQL.
