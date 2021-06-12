SET SCHEMA 'data';

create function delete_product(p_product_id UUID)
returns void
language plpgsql
as
$$
declare
begin
	DELETE
	from data.products p
	WHERE p.product_id = p_product_id;
end;
$$;