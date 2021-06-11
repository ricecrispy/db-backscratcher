create function backscratcher.data.update_product(p_product_id UUID, p_product_name TEXT, p_product_description varchar(255), p_product_sizes backscratcher.data.size[], p_product_price float8)
returns void
language plpgsql
as
$$
declare
begin
	UPDATE data.products
	SET product_name = p_product_name,
		product_description = p_product_description,
		product_sizes = p_product_sizes,
		product_price = p_product_price
	WHERE product_id = p_product_id;
end;
$$;