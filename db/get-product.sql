create function backscratcher.data.get_product(p_product_id UUID)
returns TABLE (product_id UUID, product_name VARCHAR(100), product_description TEXT, product_sizes size[], product_price float8)
language plpgsql
as
$$
declare
begin
	RETURN QUERY
	SELECT * from data.products p
	WHERE p.product_id = p_product_id;
end;
$$;