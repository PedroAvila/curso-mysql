select
    *
from
    employee_demographics;

select
    *
from
    employee_salary;

/* SELECT dem.employee_id, age, occupation 
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
 ON dem.employee_id = sal.employee_id
 */
SELECT
    *
FROM
    employee_demographics AS dem
    INNER JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;

SELECT
    *
FROM
    employee_demographics AS dem
    LEFT JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;

SELECT
    *
FROM
    employee_demographics AS dem
    RIGHT JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;

-- TIPOS DE DATOS DECIMAL
DROP TABLE tiposDeDatos;

CREATE TABLE tiposDeDatos (
    decimal65_2 decimal(65, 2),
    decimalType decimal(5, 3)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

DELETE FROM
    tiposDeDatos;

INSERT INTO
    tiposDeDatos (decimal65_2)
VALUES
    (
        65406465445646546546546546546546546111212326789012345678902345.21
    );

SELECT
    *
FROM
    tiposDeDatos;

DELETE FROM
    tiposDeDatos;

INSERT INTO
    tiposDeDatos (decimalType)
VALUES
    (12.123);

SELECT
    *
FROM
    tiposDeDatos;

/*
 CONSULTAS
 */
SELECT
    *
FROM
    personas;

SELECT
    nombre,
    correo
FROM
    personas
ORDER BY
    nombre DESC;

SELECT
    fechaES,
    montoIE
FROM
    entradaSalidaDinero
WHERE
    fechaES BETWEEN '2018-01-01'
    AND '2018-01-31'
ORDER BY
    fechaES;

SELECT
    id,
    fechaES,
    montoIE * 2 AS "multiploPor2"
FROM
    entradaSalidaDinero
WHERE
    montoIE >= 500;

/*
 OPERADORES ARITMÉTICOS ORDEN DE PRESEDENCIA
 | * | Multiplicación | SELECT 5*2 → 10 |
 | / | División | SELECT 10/3 → 3.3333 |
 | DIV | División entera | SELECT 10 DIV 3 → 3 |
 | %, MOD | Módulo (resto) | SELECT 10%3 → 1 |
 | + | Suma | SELECT 5+3 → 8 |
 | - | Resta | SELECT 5-3 → 2 |
 */
SELECT
    idIngresosEgresos,
    montoIE,
    montoIE / 2 AS 'divisonDos',
    montoIE DIV 2 AS 'parteEntera',
    montoIE MOD 2 AS 'residuo'
FROM
    entradaSalidaDinero
WHERE
    id = 368;

SELECT
    idIngresosEgresos,
    montoIE,
    montoIE + 2 * 3 AS 'sinParentesis',
    (montoIE + 2) * 3 AS 'conParentesis'
FROM
    entradaSalidaDinero
WHERE
    id = 21;

SELECT
    *,
    CONCAT(
        nombre,
        ' ',
        correo,
        ' con fecha: ',
        now()
    ) AS 'campoContatenado'
FROM
    personas;

SELECT
    *
FROM
    entradaSalidaDinero;

SELECT
    id,
    fechaES,
    DATE_FORMAT(fechaES, '%d/%m/%y') AS 'fecha1',
    DATE_FORMAT(fechaES, '%e-%b-%Y') AS 'fecha2',
    observaciones,
    LEFT(observaciones, 10) AS 'primeros10Caracteres',
    montoIE,
    ROUND(montoIE) AS 'redondeo',
    ROUND(montoIE, 1) AS 'redondeo1Decimal',
    ROUND(montoIE, 2) AS 'redondeo2Decimal'
FROM
    entradaSalidaDinero
WHERE
    id > 500;

SELECT
    CURRENT_DATE(),
    DATE_FORMAT(CURRENT_DATE(), '%M/%D/%Y');

SELECT
    "HOLA MUNDO" AS 'Cadena',
    LEFT(
        CONCAT(
            "HOLA MUNDO",
            " HOY ES UN BUEN DÍA"
        ),
        10
    ) AS 'Cadena2';

SELECT
    SUM(10 + 15),
    ROUND(154.694, 2) AS 'Redondeado';

SELECT
    DISTINCT fechaES
FROM
    entradaSalidaDinero;

SELECT
    DISTINCT YEAR(fechaES)
FROM
    entradaSalidaDinero;

SELECT
    DISTINCT (idEstatusPendiente)
FROM
;

SELECT
    DISTINCT (idEstatusPendiente),
    es.estatus
FROM
    AS pe
    INNER JOIN estatusPendiente AS es ON pe.idEstatusPendiente = es.id;

SELECT
    *
FROM
    estatusPendiente;

SELECT
    *
FROM
    personas
WHERE
    id < 8;

SELECT
    *
FROM
    personas
WHERE
    id <> 8;

-- * Cuando se filtra una consulta por fecha se debe poner la fecha entre comillas en el orden y-m-d
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    fechaES = '2018-01-01';

SELECT
    *,
    montoIE / 2 AS 'Dividido - 2'
FROM
    entradaSalidaDinero
WHERE
    (montoIE / 2) < 1000;

SELECT
    *,
    LEFT(nombre, 1)
FROM
    personas
WHERE
    LEFT(nombre, 1) < 'K';

SELECT
    *
FROM
    personas
WHERE
    id != 8
    AND LEFT(telefono, 3) = '493'
    AND MOD(id, 2) = 0;

SELECT
    *
FROM
    personas
WHERE
    LEFT(telefono, 3) = '493'
    OR LEFT(telefono, 3) = '444';

SELECT
    *
FROM
    personas
WHERE
    LEFT(telefono, 3) != '493';

SELECT
    *
FROM
    personas
WHERE
    NOT LEFT(telefono, 3) = '493';

SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    (
        montoIE >= 5000
        OR fechaES <= '2018-12-31'
    );

SELECT
    *
FROM
    personas
WHERE
    NOT (
        id = 8
        OR id = 10
        OR id = 3
    )
    AND id = 4;

SELECT
    *
FROM
    personas
WHERE
    id IN(1, 2, 3, 4);

SELECT
    *
FROM
    personas
WHERE
    id NOT IN(1, 2, 3, 4);

SELECT
    *
FROM
    personas
WHERE
    nombre NOT IN(
        'JUAN PEREZ GARCIA',
        'ARACELI ORTIZ PINEDO',
        'ANDRES PEREZ LOPEZ'
    );

SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    idPersonas IN(
        SELECT
            id
        FROM
            personas
        WHERE
            nombre IN(
                'JUAN PEREZ GARCIA',
                'ARACELI ORTIZ PINEDO',
                'ANDRES PEREZ LOPEZ'
            )
    );

SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    (
        fechaES BETWEEN '2018-01-01'
        AND '2018-12-31'
    )
    AND (
        montoIE BETWEEN 100
        AND 2000
    );

SELECT
    *
FROM
    personas
WHERE
    nombre BETWEEN 'A'
    AND 'K';

-- ! dbEmployees
SELECT
    COUNT(*)
FROM
    employees;

SELECT
    *
FROM
    employees
WHERE
    first_name REGEXP 'SA'
    AND last_name REGEXP 'sa';

SELECT
    *
FROM
    employees
WHERE
    first_name REGEXP '^sa'
    AND last_name REGEXP '^SA';

SELECT
    *
FROM
    employees
WHERE
    last_name REGEXP 'na$'
    AND first_name REGEXP 'na$';

SELECT
    *
FROM
    employees
WHERE
    first_name REGEXP 'rs|sn'
    AND last_name REGEXP 'rs|sn|an';

SELECT
    *
FROM
    employees
WHERE
    first_name REGEXP 'n[ia]'
    AND last_name REGEXP 'n[ue]';

SELECT
    *
FROM
    employees
WHERE
    first_name REGEXP 'n[a-f]'
    AND last_name REGEXP 'n[f-k]';

SELECT
    *
FROM
    employees
WHERE
    first_name REGEXP 'mar[iy][ao]';

SELECT
    *
FROM
    employees
WHERE
    first_name REGEXP '[a-z][aeiou]n$';

SELECT
    *
FROM
    employees
WHERE
    first_name LIKE 'Man%'
    AND last_name LIKE 'Man%';

SELECT
    *
FROM
    employees
WHERE
    first_name LIKE 'Ma__u%'
    AND last_name LIKE 'Ma__u%';

SELECT
    *
FROM
    employees
WHERE
    first_name LIKE '%ton'
    AND last_name LIKE '%ton';

SELECT
    *
FROM
    employees
WHERE
    first_name LIKE '%uan%'
    AND last_name LIKE '%uan%';

SELECT
    *
FROM
    employees
WHERE
    first_name LIKE '_____'
    AND last_name LIKE '_____';

SELECT
    birth_date,
    first_name,
    last_name
FROM
    employees
ORDER BY
    last_name ASC;

SELECT
    birth_date,
    first_name,
    last_name
FROM
    employees
ORDER BY
    last_name ASC,
    birth_date DESC;

SELECT
    birth_date,
    CONCAT(last_name, ' ', first_name) AS nombreCompleto
FROM
    employees
ORDER BY
    nombreCompleto;

SELECT
    birth_date,
    CONCAT(last_name, ' ', first_name) AS nombreCompleto,
    DATEDIFF(NOW(), birth_date) / 365 AS edad
FROM
    employees
ORDER BY
    DATEDIFF(NOW(), birth_date) / 365 DESC;

SELECT
    birth_date,
    CONCAT(last_name, ' ', first_name) AS nombreCompleto,
    DATEDIFF(NOW(), birth_date) / 365 AS edad
FROM
    employees
ORDER BY
    3,
    2 DESC;

SELECT
    DATEDIFF(NOW(), '1976-08-10') / 365 AS edad;

/*
 * Usando FIELD el ordenamiento dentro es de derecha a izquierda.
 */
SELECT
    *
FROM
    titles
WHERE
    emp_no BETWEEN 10001
    AND 10500
ORDER BY
    FIELD(title, 'Senior Staff', 'Engineer') DESC;

USE db;

SELECT
    *
FROM
ORDER BY
    id ASC
LIMIT
    10;

-- DESCRIBE ;
SELECT
    *
FROM
ORDER BY
    id ASC
LIMIT
    1, 2;

SELECT
    es.fechaES,
    es.montoIE,
    es.idPersonas,
    p.nombre,
    ie.descripcion,
    tipoIE.descripcion,
    gruIE.descripcion
FROM
    entradaSalidaDinero AS es
    INNER JOIN personas AS p ON es.idPersonas = p.id
    INNER JOIN ingresosEgresos AS ie ON ie.id = es.idIngresosEgresos
    INNER JOIN tipoIngEg AS tipoIE ON tipoIE.id = ie.idTipoIngEg
    INNER JOIN grupoIngEg AS gruIE ON gruIE.id = ie.idGrupoIngEg;

SELECT
    es.fechaES,
    es.montoIE,
    es.idPersonas,
    p.nombre
FROM
    entradaSalidaDinero AS es
    INNER JOIN personas AS p ON es.idPersonas = p.id
SELECT
    *
FROM
    ingresosEgresos;

SELECT
    *
FROM
    tipoIngEg;

SELECT
    *
FROM
    grupoIngEg
SELECT
    *
FROM
    employees
WHERE
    emp_no IN(1, 4);

-- INSERT INTO employees VALUES(1, '1981-10-16', 'Juan', 'Perez Garcia', 'M', '2008-02-01');
-- INSERT INTO employees VALUES(4, '1982-12-20', 'Jose Luis', 'Montez Quiñones', 'M', '2009-02-01');
SELECT
    *
FROM
    salaries
WHERE
    emp_no IN(1, 4)
SELECT
    p.nombre,
    e.gender,
    s.salary
FROM
    personas p
    INNER JOIN dbEmployees.employees e ON e.emp_no = p.id
    INNER JOIN dbEmployees.salaries s ON s.emp_no = p.id;

SELECT
    *
FROM
    personas p
    LEFT JOIN dbEmployees.employees e ON e.emp_no = p.id;

SELECT
    *
FROM
    dbEmployees.employees e
    LEFT JOIN personas p ON p.id = e.emp_no;

SELECT
    *
FROM
    dbEmployees.employees e
    RIGHT JOIN personas p ON p.id = e.emp_no;

USE dbEmployees;

-- * Nos arroja este resultado 443308 / 4638507
SELECT
    COUNT(*)
FROM
    employees e
    INNER JOIN titles t ON e.emp_no = t.emp_no
    INNER JOIN salaries s ON s.emp_no = e.emp_no;

-- * Este tipo de instrucciones USING y NATURAL es mejor no usarlos.
SELECT
    COUNT(*)
FROM
    employees
    INNER JOIN titles USING(emp_no)
    INNER JOIN salaries USING(emp_no);

SELECT
    COUNT(*)
FROM
    employees NATURAL
    JOIN titles
    INNER JOIN salaries USING(emp_no);

USE db;

-- * Se obtiene el mismo resultado que un INNER JOIN 
SELECT
    entradaSalidaDinero.fechaES,
    entradaSalidaDinero.montoIE,
    entradaSalidaDinero.idPersonas,
    personas.nombre,
    ingresosEgresos.descripcion,
    tipoIngEg.descripcion,
    grupoIngEg.descripcion
FROM
    entradaSalidaDinero,
    personas,
    ingresosEgresos,
    tipoIngEg,
    grupoIngEg
WHERE
    entradaSalidaDinero.idPersonas = personas.id
    AND ingresosEgresos.id = entradaSalidaDinero.idIngresosEgresos
    AND tipoIngEg.id = ingresosEgresos.idTipoIngEg
    AND grupoIngEg.id = ingresosEgresos.idGrupoIngEg;

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes(
    id INT NOT NULL AUTO_INCREMENT,
    apaterno VARCHAR(45) NULL,
    amaterno VARCHAR(45) NULL,
    nombre VARCHAR(45) NULL,
    correo VARCHAR(45) NULL,
    telefono VARCHAR(45) NULL,
    calle VARCHAR(100) NULL,
    numero VARCHAR(45) NULL,
    colonia VARCHAR(100) NULL,
    municipio VARCHAR(45) NULL,
    PRIMARY KEY (id)
) Engine Innodb;

SHOW VARIABLES LIKE "secure_file_priv";

SELECT
    *
FROM
    personas;

SELECT
    *
FROM
    clientes;

SELECT
    id,
    nombre,
    correo,
    telefono AS telefonoclienteopersona
FROM
    personas
UNION
ALL
SELECT
    id,
    CONCAT(nombre, ' ', apaterno, ' ', amaterno),
    correo,
    telefono as tel
FROM
    clientes
ORDER BY
    id;

SELECT
    *
FROM
    clientes
WHERE
    apaterno = 'PEREZ'
UNION
ALL
SELECT
    *
FROM
    clientes
WHERE
    LEFT(telefono, 3) <> '340';

/*
 *  La subconsulta que se compara en el WHERE se llama SubConsulta Escalar
 */
SELECT
    *,
    (
        SELECT
            AVG(montoIE)
        FROM
            entradaSalidaDinero
    ) AS promedio
FROM
    entradaSalidaDinero
WHERE
    montoIE < (
        SELECT
            AVG(montoIE)
        FROM
            entradaSalidaDinero
    );

/*
 * SubConsultas de listas
 */
SELECT
    p.nombre,
    idPersonas,
    idIngresosEgresos,
    montoIE
FROM
    entradaSalidaDinero es
    INNER JOIN personas p
WHERE
    nombre LIKE '%JUAN%';

SELECT
    idPersonas,
    idIngresosEgresos,
    montoIE
FROM
    entradaSalidaDinero
WHERE
    entradaSalidaDinero.idPersonas IN(
        SELECT
            id
        FROM
            personas
        WHERE
            personas.nombre LIKE '%JUAN%'
    );

-- * MontoIE > all
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE > ALL(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 1
    );

-- * MontoIE < all
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE < ALL(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 1
    );

-- * MontoIE = all 
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE = ALL(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 3
    );

-- * MontoIE <> all
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE <> ALL(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 1
    );

-- * Excepcion datos vacios siempre sera TRUE 
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE > ALL(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 100000
    );

/*
 * SubConsultas ANY
 */
-- * MontoIE > ANY es mayor a cualquiera pero siempre va a comparar con el menor
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE > ANY(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 1
    );

-- * MontoIE < ANY debe ser menor al mayor
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE < ANY(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 1
    );

-- * MontoIE = ANY igual a cualquiera que viene en la subconsulta
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE = ANY(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 1
    );

-- * MontoIE <> ANY, es recomendado no utilizar 
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE <> ANY(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 3
    );

-- * Excepcion de datos vacios siempre sera TRUE
SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    montoIE > ANY(
        SELECT
            montoIE
        FROM
            entradaSalidaDinero
        WHERE
            idIngresosEgresos = 100000
    );

SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    idPersonas IN(1, 2);

SELECT
    idPersonas,
    AVG(montoIE)
FROM
    entradaSalidaDinero
WHERE
    idPersonas IN(1, 2)
GROUP BY
    1;

/*
 * Sacamos el promedio de cada idPersona, luego con ese promedio mostramos los registros de la tabla entradaSalidaDinero 
 * comparando por cada idPersona su propio promedio para mostrar solo los que sean mayor a su propio promedio
 */
SELECT
    *,
    (
        SELECT
            AVG(montoIE)
        FROM
            entradaSalidaDinero
        WHERE
            idPersonas = esd.idPersonas
    ) AS PromedioPorId
FROM
    entradaSalidaDinero esd
WHERE
    montoIE < (
        SELECT
            AVG(montoIE)
        FROM
            entradaSalidaDinero
        WHERE
            idPersonas = esd.idPersonas
    );

/*
 *  Selecciona todos los registros de la tabla personas que no tengan usuario en la tabla de usuarios
 */
SELECT
    *
FROM
    personas
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            usuarios
        WHERE
            personas.id = usuarios.idPersonas
    );

/*
 *  Selecciona todas las personas o todos los registros de la tabla de personas que no tengan ni un solo registro en la tabla de 
 */
SELECT
    *
FROM
    personas
WHERE
    NOT EXISTS(
        SELECT
            *
        FROM
        WHERE
            personas.id =.idPersonaAsignado
    );

/*
 *   Selecciona todas las personas de la tabla de personas que no tengan entradas o salidas de dinero en la tabla entradaSalidaDinero
 */
SELECT
    *
FROM
    personas
WHERE
    NOT EXISTS(
        SELECT
            *
        FROM
            entradaSalidaDinero
        WHERE
            entradaSalidaDinero.idPersonas = personas.id
    );

SELECT
    *
FROM
    entradaSalidaDinero
WHERE
    idPersonas = 14;

/*
 *  Hacer uso de una subConsulta utilizando las tablas entradaSalidaDinero y la tabla de personas para que podamos extraer de
 *  dicha union el idPersonas, el nombre y la suma de sus ingresos egresos, una vez que tengamos esta tabla virtual
 *  hay que hacer un INNER JOIN con la tabla de usuarios para poder filtrar las personas con id = 1,2,3 
 *  y mostrar campos de la tabla virtual y de la tabla usuarios(la externa no virtual) 
 */
-- * Cuando se usa SUM hay que hacer un GROUP BY con lo que esta antes de SUM es una regla.
SELECT
    aux.nombre,
    u.nombre,
    SUM(total)
FROM
    (
        SELECT
            esd.idPersonas,
            p.nombre,
            SUM(montoIE) AS Total
        FROM
            personas p
            INNER JOIN entradaSalidaDinero esd ON esd.idPersonas = p.id
        GROUP BY
            p.id,
            p.nombre
    ) aux
    INNER JOIN usuarios u ON u.idPersonas = aux.idPersonas
WHERE
    aux.idPersonas IN(1, 2, 3)
GROUP BY
    aux.nombre,
    u.nombre;