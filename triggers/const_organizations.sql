CREATE OR REPLACE FUNCTION fest.tfun_const_organizations()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE EXCEPTION 'It is forbidden to change organizations';
END;
$$;


CREATE OR REPLACE TRIGGER t_const_organizations
BEFORE UPDATE ON fest.organizations
FOR EACH ROW
EXECUTE FUNCTION fest.tfun_const_organizations();

UPDATE fest.organizations
SET field = 'IT'
WHERE org = 'Organization_A';
