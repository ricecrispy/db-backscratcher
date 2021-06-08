# db-backscratcher
PostgreSQL database for backscratcher API

## Purpose
A collection of scripts to create the database for the [backscratcher API](https://github.com/ricecrispy/svc-backscratcher).

## Built With
[PostgreSQL](https://www.postgresql.org/) - a powerful, open source object-relational database system

## Prerequisites
A local PostgreSQL server

## Getting Started:

1. Clone the repository
```
git clone https://github.com/ricecrispy/db-backscratcher
cd db-backscratcher
```

2. Set up the database
- run `create-database.sql`.
- run `create-table.sql`.
- run `create-product.sql`, `delete-product.sql`, `get-all-products.sql`, `get-product.sql`, and `update-product.sql` in any order.

## Database Structure

### Database
- backscratcher: the main database where everything is located.

### Schema
- data: the main schema where the table, functions, and type are located.
- pgcrypto: the schema required to use the `pgcrypto` extension.

### Type
- size: An enum type that represents the available sizes of a backscratcher.

### Table
- products: the table where information about backscratchers are located.

Product Table Columns
- product_id: the identifier of the product. Type `UUID`.
- product_name: the name of the product. Type `VARCHAR(100)`.
- product_description: the description of the product. Type `TEXT`.
- product_sizes: the availble sizes of the product. Type `size[]`.
- product_price: the price of the product: Type `float8`.

### Functions
create_product
```
Description: create a product
Inputs:
- p_product_name varchar(100): the name
- p_product_description TEXT: the description
- p_product_sizes size[]: the sizes
- p_product_price float8: the price
Output:
- product_id UUID: the ID of the newly created product
```

get_all_products
```
Description: get all products
Input:
- None
Output:
- TABLE (product_id UUID, product_name VARCHAR(100), product_description TEXT, product_sizes size[], product_price float8): data of all products
```

get_product
```
Description: get a product by ID
Input:
- p_product_id UUID: the ID of the product
Output:
- TABLE (product_id UUID, product_name VARCHAR(100), product_description TEXT, product_sizes size[], product_price float8): data of the product
```

update_product
```
Description: update a product
Input:
- p_product_id UUID: The ID of the product
- p_product_name TEXT: the updated name of the product
- p_product_description varchar(255): the updated description of the product
- p_product_sizes size[]: the updated available sizes of the product
- p_product_price float8: the updated price of the product
Output:
- None
```

delete_product
```
Description: delete a product
Input:
- p_product_id UUID: The ID of the product
Output:
- None
```