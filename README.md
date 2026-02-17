# PostgreSQL Learning Repository

A hands-on collection of SQL scripts covering PostgreSQL fundamentals — from basic CRUD operations to multi-table joins and search queries.

## Repository Structure

```
Postgre_SQL/
├── intro-to-sql.sql
├── Search_SQLs/
│   ├── world.sql
│   └── clues.sql
└── joins/
    └── queries.sql
```

## Contents

### `intro-to-sql.sql`

Covers core SQL fundamentals using a music-themed dataset (`bands` and `musicians` tables):

- **Database & Table Management** — `CREATE DATABASE`, `CREATE TABLE`, primary keys, foreign keys
- **Data Manipulation** — `INSERT`, `UPDATE`, `DELETE`
- **Querying** — `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `COUNT`
- **Conditional Logic** — `BETWEEN`, `LIKE`, `IN`, `IS NULL`, `AND` / `OR` / `NOT`
- **Joins** — basic `JOIN` between related tables

### `Search_SQLs/`

SQL search and filtering exercises using a world geography database.

#### `world.sql`

Database setup script that creates and populates three tables:

| Table               | Description                                            |
| ------------------- | ------------------------------------------------------ |
| `cities`            | Urban population data (name, country code, district)   |
| `countries`         | National info (continent, region, population, GNP)     |
| `countrylanguages`  | Language mappings with official status and speaker %    |

#### `clues.sql`

A detective-style exercise (Carmen Sandiego theme) that teaches querying through progressive clues:

- Multi-table `JOIN` queries across countries, cities, and languages
- Pattern matching with `LIKE` and wildcards
- Filtering with `WHERE`, `ORDER BY`, and `LIMIT`
- Table aliases for cleaner queries

### `joins/`

#### `queries.sql`

Deep-dive into all major join types using an ice cream production dataset (`ice_creams`, `plants`, `ingredients`, `ice_creams_ingredients`):

| Join Type           | Description                                          |
| ------------------- | ---------------------------------------------------- |
| `INNER JOIN`        | Returns only matching records between tables         |
| `LEFT JOIN`         | All records from the left table + matches from right |
| `RIGHT JOIN`        | All records from the right table + matches from left |
| `FULL OUTER JOIN`   | All records from both tables combined                |
| `CROSS JOIN`        | Cartesian product of all row combinations            |

Also covers `UPDATE` statements, `AVG()` aggregation, and `WHERE` / `LIKE` filtering.

## Getting Started

### Prerequisites

- [PostgreSQL](https://www.postgresql.org/download/) installed and running

### Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/Ali-Hassan-2000/Postgre_SQL.git
   cd Postgre_SQL
   ```

2. Start with the intro script:
   ```bash
   psql -f intro-to-sql.sql
   ```

3. Set up the world database and try the clues:
   ```bash
   psql -f Search_SQLs/world.sql
   psql -f Search_SQLs/clues.sql
   ```

4. Explore join types:
   ```bash
   psql -f joins/queries.sql
   ```

## Topics Covered

- Database and table creation
- CRUD operations (Create, Read, Update, Delete)
- Filtering and conditional logic
- Pattern matching
- Sorting and pagination
- Aggregate functions
- All major JOIN types
- Foreign keys and relational data modeling

## License

This project is open source and available for educational use.
