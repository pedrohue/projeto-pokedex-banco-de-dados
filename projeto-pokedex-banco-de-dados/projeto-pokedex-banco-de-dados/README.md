# Projeto Pokédex — Banco de Dados

Projeto acadêmico de modelagem e implementação de um banco de dados relacional para um sistema Pokédex, utilizando MySQL.

## Sobre o projeto

O banco de dados organiza informações sobre regiões, tipos de Pokémon, espécies, treinadores e capturas. Também representa a relação de evolução entre espécies e permite automatizar a evolução de um Pokémon capturado por meio de uma stored procedure.

## Conteúdos trabalhados

- Modelagem conceitual e lógica (MER e DER)
- Criação de banco de dados e tabelas com SQL (DDL)
- Inserção de dados (DML)
- Chaves primárias e estrangeiras
- Relacionamentos 1:N e N:N
- Auto-relacionamento para representar evoluções
- Trigger para limitar cada espécie a, no máximo, dois tipos
- Stored procedure para realizar evoluções por nível
- Consultas SQL: SELECT, filtros, agregações, GROUP BY e HAVING (descritas no relatório)

## Estrutura

```text
projeto-pokedex-banco-de-dados/
├── documentos/
│   └── relatorio-pokedex.pdf
├── sql/
│   ├── 01_criacao_tabelas.sql
│   ├── 02_trigger_procedure.sql
│   └── 03_insercao_dados.sql
└── README.md
```

## Como executar

1. Abra o MySQL Workbench ou outro cliente MySQL.
2. Execute `sql/01_criacao_tabelas.sql` para criar o banco e as tabelas.
3. Execute `sql/02_trigger_procedure.sql` para criar a trigger e a stored procedure.
4. Execute `sql/03_insercao_dados.sql` para inserir os dados iniciais.

**Atenção:** o primeiro script contém `DROP DATABASE IF EXISTS pokedex`, portanto apaga um banco existente com esse nome antes de recriá-lo. Execute-o somente se estiver de acordo com isso.

## Documentação

O relatório completo da modelagem e implementação está disponível em `documentos/relatorio-pokedex.pdf`.

O relatório também descreve consultas SQL com filtros e agregações. Os comandos dessas consultas não foram incluídos como arquivos separados porque não aparecem integralmente no PDF disponibilizado.

## Tecnologias

- MySQL
- SQL
- MySQL Workbench
