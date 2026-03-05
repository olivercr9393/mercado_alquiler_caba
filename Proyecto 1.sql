CREATE DATABASE alquiler_caba;
USE alquiler_caba;

-- Importe los archivos CVS aca y les cambie el nombre:
-- 'promedio_precio_caba' para 'Precio de departamentos en alquiler de 1 a 3 ambientes'
-- 'porcentaje_publicaciones' para 'Porcentaje de departamentos en alquiler'
-- 'alquiler_1_ambiente' para 'Precio alquiler 1 ambiente'
-- 'alquiler_2_ambiente' para 'Precio alquiler 2 ambientes'
-- 'alquiler_3_abiente' para 'Precio alquiler 3 ambientes'

ALTER TABLE promedio_precio_caba
ADD COLUMN fecha DATE;
-- Se agrega una columna para cambiar el formato de fecha ya que MySQL no admite nombres de meses en español

SELECT * FROM promedio_precio_caba;

SELECT
	STR_TO_DATE(
		CONCAT(
			año, '-',
            CASE mes
				WHEN 'Enero' THEN '01'
                WHEN 'Febrero' THEN '02'
                WHEN 'Marzo' THEN '03'
                WHEN 'Abril' THEN '04'
                WHEN 'Mayo' THEN '05'
                when 'Junio' THEN '06'
                WHEN 'Julio' THEN '07'
                WHEN 'Agosto' THEN '08'
                WHEN 'Septiembre' THEN '09'
                WHEN 'Octubre' THEN '10'
                WHEN 'Noviembre' THEN '11'
                WHEN 'Diciembre' THEN '12'
			END,
            '-01'
        ),
        '%Y-%m-%d'
    ) AS fecha,
    1_ambiente,
    2_ambientes,
    3_ambientes
FROM promedio_precio_caba
ORDER BY fecha;
-- Consulta para cambiar el formato de la fecha, abajo la ejecución

UPDATE promedio_precio_caba
SET fecha = STR_TO_DATE(
		CONCAT(
			año, '-',
            CASE mes
				WHEN 'Enero' THEN '01'
                WHEN 'Febrero' THEN '02'
                WHEN 'Marzo' THEN '03'
                WHEN 'Abril' THEN '04'
                WHEN 'Mayo' THEN '05'
                when 'Junio' THEN '06'
                WHEN 'Julio' THEN '07'
                WHEN 'Agosto' THEN '08'
                WHEN 'Septiembre' THEN '09'
                WHEN 'Octubre' THEN '10'
                WHEN 'Noviembre' THEN '11'
                WHEN 'Diciembre' THEN '12'
			END,
            '-01'
        ),
        '%Y-%m-%d'
    )
WHERE año IS NOT NULL;
-- La misma query de arriba pero esta es para añadir los datos, no una consulta
-- Agregue la clausula WHERE ya que el SafeUpdate de MySQL no me permitir hacer la modificación

WITH extremos AS (
	SELECT
		MIN(fecha) AS fecha_inicio,
        MAX(fecha) AS fecha_fin
	FROM promedio_precio_caba
),
inicio AS(
	SELECT *
    FROM promedio_precio_caba
    WHERE fecha = (SELECT fecha_inicio FROM extremos)
),
fin AS(
	SELECT *
    FROM promedio_precio_caba
    WHERE fecha = (SELECT fecha_fin FROM extremos)
)
SELECT
	ROUND(
		(fin.1_ambiente - inicio.1_ambiente)
        / inicio.1_ambiente * 100, 2
    ) AS aumento_porcentaje_1,
    ROUND(
		(fin.2_ambientes - inicio.2_ambientes)
        / inicio.2_ambientes * 100, 2
    ) AS aumento_porcentaje_2,
    ROUND(
		(fin.3_ambientes - inicio.3_ambientes)
        / inicio.3_ambientes * 100, 2
    ) AS aumento_porcentaje_3
FROM inicio, fin;
-- Respuesta 5.1
-- Consulta necesaria para sacar el aumento del porcentaje de aumento de los precios

WITH ultimo_año AS (
	SELECT MAX(YEAR(fecha)) AS año
    FROM promedio_precio_caba
)
SELECT
	ROUND(AVG(1_ambiente), 0) AS porcentaje_1_ambiente,
    ROUND(AVG(2_ambientes), 0) AS porcentaje_2_ambientes,
    ROUND(AVG(3_ambientes), 0) AS porcentaje_3_ambientes
FROM promedio_precio_caba
WHERE YEAR(fecha) = (SELECT año FROM ultimo_año);
-- Respuesta 5.2
-- Para saber un promedio de los precios de alquileres de los distintos ambientes en el último año de análisis (2025)

WITH ultimo_año AS(
	SELECT MAX(YEAR(fecha)) AS año
    FROM promedio_precio_caba
),
promedios AS(
	SELECT
		AVG(1_ambiente) AS p1,
        AVG(2_ambientes) AS p2,
        AVG(3_ambientes) AS p3
	FROM promedio_precio_caba
	WHERE YEAR(fecha) = (SELECT año FROM ultimo_año)
)
SELECT
	ROUND(p2 - p1, 0) AS diferencia_2vs1_pesos,
    ROUND((p2 - p1) / p1 * 100, 2) AS diferencia_2vs1_porcentaje,
    
    ROUND(p3 - p2, 0) AS diferencia_3vs2_pesos,
    ROUND((p3 - p2) / p2 * 100, 2) AS diferencia_3vs2_porcentaje,
    
    ROUND(p3 - p1, 0) AS diferencia_3vs1_pesos,
    ROUND((p3 - p1) / p1 * 100, 2) AS diferencia_3vs1_porcentaje
    
FROM promedios;
-- Respuesta 5.2
-- Consulta necesaria para saber la diferencia en precio y pocentaje de los distintos ambientes

SELECT * FROM porcentaje_publicaciones;

SELECT
	ROUND(AVG(1_ambiente), 2) AS porcentaje_1_ambiente,
    ROUND(AVG(2_ambientes), 2) AS porcentaje_2_ambientes,
    ROUND(AVG(3_ambientes), 2) AS porcentaje_3_ambientes,
    ROUND(AVG(4y5_ambientes), 2) AS porcentaje_4y5_ambientes
FROM porcentaje_publicaciones;
-- Respuesta 5.3
-- Consulta para saber cuales han sido los ambientes que mas han dominado la oferta en el periodo de estudio, porcentualmente

SELECT
	ROUND(AVG(nuevos), 2) AS porcentaje_nuevos,
    ROUND(AVG(usados), 2) AS porcentaje_usados
FROM porcentaje_publicaciones;
-- Respuesta 5.3
-- Consulta para saber cual es el porcentaje de dominio de departamentos nuevos y usados, porcentualmente

ALTER TABLE porcentaje_publicaciones
ADD COLUMN fecha DATE;
-- Se agrega una columna para cambiar el formato de fecha ya que MySQL no admite nombres de meses en español

UPDATE porcentaje_publicaciones
SET fecha = STR_TO_DATE(
	CONCAT(
		año, '-',
        CASE Mes
			WHEN 'Enero' THEN '01'
			WHEN 'Febrero' THEN '02'
			WHEN 'Marzo' THEN '03'
			WHEN 'Abril' THEN '04'
			WHEN 'Mayo' THEN '05'
			WHEN 'Junio' THEN '06'
			WHEN 'Julio' THEN '07'
			WHEN 'Agosto' THEN '08'
			WHEN 'Septiembre' THEN '09'
			WHEN 'Octubre' THEN '10'
			WHEN 'Noviembre' THEN '11'
			WHEN 'Diciembre' THEN '12'
		END,
        '-01'
    ),
    '%Y-%m-%d'
)
WHERE año IS NOT NULL;
-- Columna agregada y llena

SELECT
	ROUND(AVG(1_ambiente), 2) AS porcentaje_1_ambiente,
    ROUND(AVG(2_ambientes), 2) AS porcentaje_2_ambientes,
    ROUND(AVG(3_ambientes), 2) AS porcentaje_3_ambientes,
    ROUND(AVG(4y5_ambientes), 2) AS porcentaje_4y5_ambientes
FROM porcentaje_publicaciones
WHERE YEAR(fecha) = 2025;
-- Respuesta 5.3
-- Consulta para saber cuales han sido los ambientes que mas han dominado la oferta en el 2025, porcentualmente

SELECT
	ROUND(AVG(nuevos), 2) AS porcentaje_nuevos,
    ROUND(AVG(usados), 2) AS porcentaje_usados
FROM porcentaje_publicaciones
WHERE YEAR(fecha) = 2025;
-- Respuesta 5.3
-- Consulta para saber cual es el porcentaje de dominio de departamentos nuevos y usados en 2025, porcentualmente

CREATE TABLE alquiler_unificado(
	barrio VARCHAR(150),
    año INT,
    trimestre INT,
    valor FLOAT,
    ambientes INT
);
-- Se crea esta tabla para unificar a las 3 tablas de alquileres por ambientes

SELECT * FROM alquiler_unificado;

INSERT INTO alquiler_unificado (barrio, año, trimestre, valor, ambientes)
	SELECT
		barrio,
        anio,
        trimestre,
        valor,
        ambientes
	FROM alquiler_1_ambiente;
    
INSERT INTO alquiler_unificado (barrio, año, trimestre, valor, ambientes)
	SELECT
		barrio,
        año,
        trimestre,
        valor,
        ambientes
	FROM alquiler_2_ambiente;
    
INSERT INTO alquiler_unificado (barrio, año, trimestre, valor, ambientes)
	SELECT
		barrio,
        año,
        trimestre,
        valor,
        ambientes
	FROM alquiler_3_ambiente;
-- Consultas necesarias para agregar los datos y unificarlos

SELECT ambientes, COUNT(*) AS filas
FROM alquiler_unificado
GROUP BY ambientes;
-- Para saber si se añadieron correctamente las filas de los 3 datasets

SELECT * FROM alquiler_unificado;

WITH base AS (
    SELECT
        barrio,
        ambientes,
        valor,
        STR_TO_DATE(CONCAT(año, '-', trimestre * 3, '-01'), '%Y-%m-%d') AS fecha
    FROM alquiler_unificado
),
extremos AS (
    SELECT
        barrio,
        ambientes,
        MIN(fecha) AS fecha_inicio,
        MAX(fecha) AS fecha_fin
    FROM base
    GROUP BY barrio, ambientes
),
variacion AS (
    SELECT
        i.barrio,
        i.ambientes,
        ROUND((f.valor - i.valor) / i.valor * 100, 2) AS aumento_porcentual
    FROM extremos e
    JOIN base i
        ON e.barrio = i.barrio
        AND e.ambientes = i.ambientes
        AND e.fecha_inicio = i.fecha
    JOIN base f
        ON e.barrio = f.barrio
        AND e.ambientes = f.ambientes
        AND e.fecha_fin = f.fecha
)
SELECT barrio, ambientes, aumento_porcentual
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY ambientes ORDER BY aumento_porcentual DESC) AS rn
    FROM variacion
) t
WHERE rn <= 3
ORDER BY ambientes, aumento_porcentual DESC;
-- Respuesta 5.4
-- Determina el crecimiento acumulado

WITH base AS (
    SELECT
        barrio,
        ambientes,
        valor,
        STR_TO_DATE(CONCAT(año, '-', trimestre * 3, '-01'), '%Y-%m-%d') AS fecha
    FROM alquiler_unificado
    WHERE año = 2025
),
extremos AS (
    SELECT
        barrio,
        ambientes,
        MIN(fecha) AS fecha_inicio,
        MAX(fecha) AS fecha_fin
    FROM base
    GROUP BY barrio, ambientes
),
variacion AS (
    SELECT
        i.barrio,
        i.ambientes,
        ROUND((f.valor - i.valor) / i.valor * 100, 2) AS aumento_2025_porcentaje
    FROM extremos e
    JOIN base i
        ON e.barrio = i.barrio
        AND e.ambientes = i.ambientes
        AND e.fecha_inicio = i.fecha
    JOIN base f
        ON e.barrio = f.barrio
        AND e.ambientes = f.ambientes
        AND e.fecha_fin = f.fecha
)
SELECT barrio, ambientes, aumento_2025_porcentaje
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY ambientes ORDER BY aumento_2025_porcentaje DESC) AS rn
    FROM variacion
) t
WHERE rn <= 3
ORDER BY ambientes, aumento_2025_porcentaje DESC;
-- Respuesta 5.5
-- Para saber que tan estables han sido los precios en 2025, los barrios con mayor crecimiento porcentual

WITH base AS (
    SELECT
        barrio,
        ambientes,
        valor,
        STR_TO_DATE(CONCAT(año, '-', trimestre * 3, '-01'), '%Y-%m-%d') AS fecha
    FROM alquiler_unificado
    WHERE año = 2025
),
extremos AS (
    SELECT
        barrio,
        ambientes,
        MIN(fecha) AS fecha_inicio,
        MAX(fecha) AS fecha_fin
    FROM base
    GROUP BY barrio, ambientes
),
variacion AS (
    SELECT
        i.barrio,
        i.ambientes,
        ROUND((f.valor - i.valor) / i.valor * 100, 2) AS aumento_2025_porcentaje
    FROM extremos e
    JOIN base i
        ON e.barrio = i.barrio
        AND e.ambientes = i.ambientes
        AND e.fecha_inicio = i.fecha
    JOIN base f
        ON e.barrio = f.barrio
        AND e.ambientes = f.ambientes
        AND e.fecha_fin = f.fecha
)
SELECT barrio, ambientes, aumento_2025_porcentaje
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY ambientes ORDER BY aumento_2025_porcentaje ASC) AS rn
    FROM variacion
) t
WHERE rn <= 3
ORDER BY ambientes, aumento_2025_porcentaje ASC;
-- Respuesta 5.5
-- Para saber que tan estables han sido los precios en 2025, los barrios con menor crecimiento porcentual

WITH ultima_fecha AS (
    SELECT MAX(
        STR_TO_DATE(CONCAT(año, '-', trimestre * 3, '-01'), '%Y-%m-%d')
    ) AS fecha
    FROM alquiler_unificado
),
base AS (
    SELECT
        barrio,
        ambientes,
        valor,
        STR_TO_DATE(CONCAT(año, '-', trimestre * 3, '-01'), '%Y-%m-%d') AS fecha
    FROM alquiler_unificado
)
SELECT barrio, ambientes, valor
FROM (
    SELECT
        barrio,
        ambientes,
        valor,
        ROW_NUMBER() OVER (PARTITION BY ambientes ORDER BY valor DESC) AS rn
    FROM base
    WHERE fecha = (SELECT fecha FROM ultima_fecha)
) t
WHERE rn <= 3
ORDER BY ambientes, valor DESC;
-- Respuesta 5.6
-- Responde cuales son los barrios mas caros segun el ultimo trimestre

WITH ultima_fecha AS (
    SELECT MAX(
        STR_TO_DATE(CONCAT(año, '-', trimestre * 3, '-01'), '%Y-%m-%d')
    ) AS fecha
    FROM alquiler_unificado
),
base AS (
    SELECT
        barrio,
        ambientes,
        valor,
        STR_TO_DATE(CONCAT(año, '-', trimestre * 3, '-01'), '%Y-%m-%d') AS fecha
    FROM alquiler_unificado
)
SELECT barrio, ambientes, valor
FROM (
    SELECT
        barrio,
        ambientes,
        valor,
        ROW_NUMBER() OVER (PARTITION BY ambientes ORDER BY valor ASC) AS rn
    FROM base
    WHERE fecha = (SELECT fecha FROM ultima_fecha)
) t
WHERE rn <= 3
ORDER BY ambientes, valor ASC;
-- Respuesta 5.6
-- Responde cuales son los barrios mas baratos del ultimo trimestre