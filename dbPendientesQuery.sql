INSERT INTO
    personas(id, nombre)
VALUES
    (0, 'PEDRO DE LA ROSA');

INSERT INTO
    personas(id, nombre, correo)
VALUES
    (0, 'RAMON GARCIA PEREZ', 'ramon@gmail.com');

INSERT INTO
    personas(id, nombre, telefono)
VALUES
    (0, 'LETICIA ROMAN FELIX', '49215678');

INSERT INTO
    personas(id, nombre, telefono)
VALUES
    (0, 'NORMA DE LA TORRE', ' ');

SELECT
    *
FROM
    personas;

SELECT
    *
FROM
    personas
WHERE
    telefono = ' ';

SELECT
    *
FROM
    personas
WHERE
    telefono <> ' ';

SELECT
    *
FROM
    personas
WHERE
    telefono IS NULL;

SELECT
    *
FROM
    personas
WHERE
    telefono IS NOT NULL;