DROP SCHEMA public;

CREATE SCHEMA IF NOT EXISTS data;

SET SCHEMA 'data';

CREATE TYPE backscratcher.data.size AS ENUM ('S', 'M', 'L', 'XL');

CREATE TABLE IF NOT EXISTS backscratcher.data.products (
	product_id UUID PRIMARY KEY,
	product_name VARCHAR(100) UNIQUE NOT NULL,
	product_description TEXT NOT NULL,
	product_sizes size [] NOT NULL,
	product_price float8 CHECK (product_price >= 0)
);

CREATE SCHEMA IF NOT EXISTS pgcrypto;

SET SCHEMA 'pgcrypto';

CREATE EXTENSION IF NOT EXISTS pgcrypto; 
