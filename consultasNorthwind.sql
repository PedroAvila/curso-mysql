-- Clasificación de clientes por volumen de compras
SELECT
    customer_id,
    COUNT(id) AS TotalPedidos,
    CASE
        WHEN COUNT(id) > 18 THEN 'Cliente Premium'
        WHEN COUNT(id) BETWEEN 5
        AND 10 THEN 'Cliente Regular'
        ELSE 'Cliente Ocasional'
    END AS SegmentoCliente
FROM
    orders
GROUP BY
    customer_id
ORDER BY
    TotalPedidos DESC;

SELECT
    product_id,
    p.product_name,
    unit_price,
    discount,
    CASE
        WHEN discount > 0.15 THEN 'Descuento Alto'
        WHEN discount BETWEEN 0.1
        AND 0.15 THEN 'Descuento Medio'
        WHEN discount > 0
        AND discount < 0.1 THEN 'Descuento Bajo'
        ELSE 'Sin descuento'
    END AS TipoDescuento,
    unit_price * (1 - discount) AS PrecioFinal
FROM
    order_details od
    INNER JOIN products p ON p.id = od.product_id
WHERE
    discount > 0
ORDER BY
    discount DESC;

SELECT
    *
FROM
    order_details;

SELECT
    *
FROM
    products