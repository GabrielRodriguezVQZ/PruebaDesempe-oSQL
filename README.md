# EcoMarket Riwi S.A.S — Relational Database Project

## Project Description

This project transforms the operational data of **EcoMarket Riwi S.A.S**, a company dedicated to the commercialization and distribution of fresh food products to supermarkets, restaurants, and specialized stores across Colombia.

The original data was stored in a single Excel file managed by multiple areas (purchasing, logistics, inventory, and commercial), which caused critical problems:

- Clients registered multiple times with different name formats.
- Products with inconsistent names.
- Duplicate categories (singular/plural).
- Distribution centers with different names for the same location.
- Cities written in multiple ways.
- Incomplete and redundant records.

The solution implements a fully normalized relational database (up to 3NF) that guarantees data integrity, eliminates redundancy, and enables reliable business reporting.

---

## Technologies Used



| PostgreSQL | 
| SQL (DDL/DML) | 

---

## Database Engine

**PostgreSQL 15+**

- Uses `SERIAL` for auto-increment primary keys.
- Uses `NUMERIC(10,2)` for monetary values.
- Stored procedures implemented as `FUNCTION` with `LANGUAGE plpgsql`.
- All constraints enforced at the database level (PK, FK, UNIQUE, NOT NULL, CHECK).

---

## Normalization Process

### Starting Point — Raw Data

Single flat table with 20 rows and 10 columns:
`ClientName, City, Product, Category, DistributionCenter, OrderID, OrderDate, Quantity, UnitPrice, Stock`

### Inconsistencies Found and Fixed

| Column | Problem | Examples | Fixed Value |
|---|---|---|---|
| ClientName | Same client, 3 different formats | SuperMax / super max | SuperMax |
| ClientName | Same client, 2 formats | FreshMart / Fresh Mart | FreshMart |
| City | Typo | Barranquila, Bogota | Barranquilla, Bogotá |
| City | Abbreviation | B/manga | Bucaramanga |
| Category | Singular vs plural | Fruit/Fruits, Grain/Grains | Fruits, Grains |
| Category | Different name | Meats | Meat |
| Product | Different names | Gala Apple / Apple Gala | Apple Gala |
| Product | Different names | Chicken / Chicken Breast | Chicken Breast |
| DistributionCenter | Inverted name | North Center / Center North | Center North |
| DistributionCenter | Different suffix | Coastal DC / Coast DC | Coast DC |


## Database Structure

```
eco_city (id_city, city_name)
eco_client (id_client, client_name, id_city → eco_city)
eco_category (id_category, category_name)
eco_product (id_product, product_name, id_category → eco_category, unit_price, current_stock)
eco_distribution_center (id_dc, dc_name, id_city → eco_city)
eco_order (id_order, order_code, order_date, id_client → eco_client, id_dc → eco_distribution_center)
eco_order_detail (id_detail, id_order → eco_order, id_product → eco_product, quantity, unit_price)
```

---

## Instructions to Create the Database

### 1. Prerequisites

- PostgreSQL 15 or higher installed and running.
- A superuser or user with `CREATEDB` privileges.

### 2. Create the database

```bash
psql -U postgres -c "CREATE DATABASE bd_nombre_apellido_clan ENCODING 'UTF8';"
```

> Replace `bd_nombre_apellido_clan` with your actual name following the format:
> `bd_firstname_lastname_clan` — Example: `bd_maria_lopez_hopper`

### 3. Run the full script

```bash
psql -U postgres -d bd_nombre_apellido_clan -f ecomarket_postgres.sql
```

Or open the file in **pgAdmin** → Query Tool → Run (F5).

### 4. Verify the data

```sql
SELECT * FROM eco_city;
SELECT * FROM eco_client;
SELECT * FROM eco_product;
SELECT COUNT(*) FROM eco_order_detail;
```

---

## Instructions to Load Data

The data loading strategy uses **SQL INSERT scripts** directly in the DDL/DML file. This approach was chosen because:

1. The dataset is small (20 records) — CSV import would be overkill.
2. The data required manual cleaning before insertion (inconsistencies in names, cities, categories).
3. SQL scripts are fully reproducible and version-controllable.

The insertion order respects foreign key constraints:

```
eco_city → eco_client → eco_category → eco_product
→ eco_distribution_center → eco_order → eco_order_detail
```

---

## Developer Information

Gabriel Rodriguez
Clan Centurion 
Program 
RIWI

---



## Project Files

```
📁 PruebaDesempeñoSQL/
├── cargas.sql
├── consultas.sql
├── DDL.sql
├── DML.slq
├── Dataset_EcoMarketRiwi_Jornada_Tarde-Organizado.xlsx
├── README.md
├── docker-compose.yml
└── PruebaDesempeñoSQL.png
