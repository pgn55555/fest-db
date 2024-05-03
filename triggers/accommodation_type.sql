CREATE OR REPLACE FUNCTION fest.tfun_accommodation_type()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.type_acc IN (
        'Apartment',
        'Cottage',
        'Room',
        'Villa',
        'Hostel'
    ) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Wrong accommodation type';
    END IF;
END;
$$;


CREATE OR REPLACE TRIGGER t_accommodation_type
BEFORE INSERT ON fest.accommodation
FOR EACH ROW
EXECUTE FUNCTION fest.tfun_accommodation_type();

INSERT INTO fest.accommodation (name_acc, address_acc, type_acc)
VALUES ('House near sea', 'Central, 17', 'Motel');
