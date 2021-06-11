create function backscratcher.data.create_product(p_product_name varchar(100), p_product_description TEXT, p_product_sizes size[], p_product_price float8)
returns UUID
language plpgsql
as
$$
declare
	product_id UUID;
begin
	CREATE EXTENSION IF NOT EXISTS pgcrypto;
	product_id := (SELECT gen_random_uuid
                        FROM pgcrypto.gen_random_uuid());
						
	INSERT INTO data.products(product_id, product_name, product_description, product_sizes, product_price)
	VALUES(product_id, p_product_name, p_product_description, p_product_sizes, p_product_price);
	
	RETURN product_id;
end;
$$;