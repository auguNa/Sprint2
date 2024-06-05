-- 1.Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM tienda.producto;

-- 2.Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- 3.Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- 4.Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio as precio_EUR, ROUND((precio * 1.1),2) as precio_usd FROM producto;

-- 5.Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
-- Utiliza los siguientes sobrenombre para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS "nombre de producto", precio AS euros, ROUND((precio * 1.1),2) as dólares FROM producto;

-- 6.Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER (nombre) as nombre, precio FROM producto;

-- 7.Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) as nombre, precio FROM producto;

-- 8.Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(LEFT(nombre,2)) AS iniciales FROM fabricante;

-- 9.Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio,3) AS precio FROM producto;

-- 10.Lista los nombres y precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio,0) AS precio from producto;

-- 11.Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante FROM producto;

-- 12.Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13.Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14.Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15.Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16.Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17.Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. 
-- La cuarta fila también debe incluirse en la respuesta.
SELECT * FROM fabricante LIMIT 3, 2;

-- 18.Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). 
-- NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19.Lista el nombre y precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LIMIT).
-- NOTA : Aquí no podría usar MAX(precio), necesitaría GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20.Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21.Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 22.Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
-- Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;

-- 23.Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT p.codigo AS codigo_producto, p.nombre AS producto, p.codigo_fabricante, f.nombre AS fabricante 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24.Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC LIMIT 1;

-- 25.Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC LIMIT 1;

-- 26.Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT p.nombre 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

-- 27.Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT p.nombre 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 28.Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT p.nombre 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 29.Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT p.nombre 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30.Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT p.nombre, p.precio 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%e';

-- 31.Devuelve un listado con el nombre y precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT p.nombre, p.precio 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';

-- 32.Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- 33.Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT f.codigo, f.nombre 
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 34.Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
-- El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.
SELECT f.nombre AS fabricante, p.nombre AS producto 
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 35.Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.nombre 
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo IS NULL;

-- 36.Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT p.nombre 
FROM producto p, fabricante f 
WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Lenovo';

-- 37.Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
SELECT * 
FROM producto p, fabricante f 
WHERE p.codigo_fabricante = f.codigo AND p.precio = (
    SELECT MAX(precio) 
    FROM producto 
    WHERE codigo_fabricante = f.codigo AND f.nombre = 'Lenovo'
);

-- 38.Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre, p.precio
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo'
ORDER BY p.precio DESC LIMIT 1;

-- 39.Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT p.nombre, p.precio 
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Hewlett-Packard'
ORDER BY p.precio ASC LIMIT 1;

-- 40.Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT producto.nombre as "nombre producto", precio, fabricante.nombre as "fabricante"
FROM 
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Asus"
AND producto.precio >(SELECT AVG(precio)
FROM 
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Asus");