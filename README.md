Evolución del mercado de alquiler en CABA (2018-2025): análisis de precios, barrios y tipos de vivienda con SQL y Power BI.

1. Contexto

El mercado de alquiler en la Ciudad Autónoma de Buenos Aires ha sufrido fuertes variaciones nominales y una alta volatilidad en el periodo de estudio de este proyecto (2018-2025), influenciado principalmente por cambios macroeconómicos y regulatorios que impactaron en la dinámica del mercado inmobiliario.

Si bien el contexto macroeconómico influyó en la dinámica del mercado, este análisis se centra exclusivamente en la evolución cuantitativa de los precios.

Este análisis busca ser de ayuda para quienes quieran comprender cómo se ha transformado el mercado de alquileres y quizás tomar decisiones basadas en él, en ese sentido, resulta relevante analizar cómo se comportan los precios, la oferta y las diferencias entre barrios de la ciudad.

2. Objetivo del proyecto
   
El objetivo principal es analizar la evolución de los precios de alquiler de departamentos de 1, 2 y 3 ambientes en CABA y responder las siguientes preguntas:

¿Cómo evolucionaron los precios de alquiler de unidades de 1, 2 y 3 ambientes en CABA en el tiempo?

¿Cuánta diferencia de precio existe entre los distintos ambientes ofrecidos para departamentos?

¿Qué tipos de inmuebles son los más publicados y cuáles dominan la oferta?

¿Cuáles son los barrios que más han aumentado en el tiempo?

¿Cuáles son los barrios con más y menor variación porcentual en los precios en 2025?

¿Cuáles son hoy los barrios más caros y más baratos para alquilar?

El foco de esta investigación no está en solo describir precios, sino en comprender la dinámica estructural del mercado, de esta manera cualquier persona puede sacar conclusiones en base a sus preferencias.

3. Fuentes de datos.

Los datos públicos oficiales utilizados en este proyecto provienen del Instituto De Estadística y Censos de la Ciudad Autónoma de Buenos Aires (IDECBA) con un historial desde 2018 a 2025, los cuales se construyen a partir de datos de los principales portales inmobiliarios, para fines de esta investigación nos basamos en:

•	Precio promedio de publicación de departamentos en alquiler de 1, 2 y 3 ambientes usados y a estrenar.

•	Distribución porcentual de departamentos publicados en alquiler usados y a estrenar por cantidad de ambientes y por tipo.

•	Precio promedio de publicación de departamentos en alquiler de 1 ambiente usados por barrio.

•	Precio promedio de publicación de departamentos en alquiler de 2 ambientes usados por barrio.

•	Precio promedio de publicación de departamentos en alquiler de 3 ambientes usados por barrio.

Nota: Los datos representan precios de publicación y no precios efectivos de cierre.

Todos los datasets descargados fueron previamente limpiados en una hoja de cálculo de Excel y estandarizados para su posterior análisis, no se alteró ni se agregó dato alguno.

4. Metodología

4.1.	Limpieza de datos

-	Se eliminaron filas descriptivas y encabezados no estructurados para el análisis en Excel.
-	Se eliminaron las filas de barrios donde había más de un 40% de datos faltantes, esto con el objetivo de reducir sesgos derivados de series temporales incompletas.
-	Cambio de orientación, de filas a columnas. El dataset original tiene los datos para mostrarlo en un formato estadístico, pero poco práctico para la limpieza y posterior análisis, por lo que se procedió en Power Query a cambiar la ubicación de los datos sin alterar su contenido ni agregar ni modificar dígitos.
-	Se agregaron año, ambientes y trimestres como columnas para una mejor comprensión en el análisis.
-	No se encontraron datos duplicados, pero se sustituyeron los datos faltantes ‘///’ por un ‘NULL’ para su correcta interpretación en SQL y Power BI.

4.2.	Modelado de datos.

Los datos fueron modelados en una estructura tabular normalizada por medio de Power Query, para que cada fila representara una observación única.

Las bases de datos correspondientes a 1, 2 y 3 ambientes fueron unificadas en una sola tabla por medio de la variable “ambientes” en SQL para facilitar el análisis comparativo entre tipos de unidades.

Esta decisión se hizo para facilitar las consultas en SQL y su posterior visualización en Power BI.

4.3.	Análisis exploratorio.

En esta etapa se exploraron patrones generales, diferencias territoriales y comportamientos relativos entre tipos de unidades.

-	Comparaciones por barrios y ambientes del departamento.
-	Variaciones porcentuales.
-	Establecer rankings con los datos.

4.4.	Visualización.

-	Dashboard interactivo desarrollado en Power BI permitiendo filtros por barrios, ambiente y periodo.
-	Enfoque narrativo orientado a la toma de decisiones personales y comparativas de mercado.

5. Resultados

5.1. ¿Cómo evolucionaron los precios de alquiler de unidades de 1, 2 y 3 ambientes en CABA en el tiempo?

Para poder obtener una evolución en los precios de alquiler en el tiempo tomamos los valores desde el inicio del periodo hasta el último, calculamos el porcentaje de aumento y así obtuvimos el porcentaje de crecimiento nominal y los hallazgos principales fueron los siguientes:

•	Los alquileres de 1 ambientes mostraron un crecimiento nominal acumulado del 6476,55% desde 2018 al 2025.

•	Los alquileres de 2 ambientes mostraron un crecimiento nominal acumulado del 6479,38% desde 2018 al 2025.

•	Los alquileres de 3 ambientes mostraron un crecimiento nominal acumulado del 6159,01% desde 2018 al 2025.

Estos resultados evidencian un crecimiento sostenido entre ambientes en el mercado de alquiler, este aumento nominal impactó de forma estructural a todo el mercado y no solo a un segmento en específico. En todos los ambientes hubo un incremento parecido, se puede explicar este fenómeno tomando en cuenta la inflación acumulada, pero no es el objetivo de este proyecto.

5.2. ¿Cuánta diferencia de precio existe entre los distintos ambientes ofrecidos para departamentos?

Para saber la diferencia de precios entre los distintos ambientes primero vamos a hacer un promedio de los precios de alquileres de los distintos ambientes en el último año de análisis (2025) y los hallazgos que encontramos fueron:

•	Promedio 1 ambiente: 449.837 ARS.

•	Promedio 2 ambientes: 606.497 ARS.

•	Promedio 3 ambientes: 913.863 ARS.

Tras estos promedios, podemos calcular la diferencia de precios entre ambientes, la cual nos indica lo siguiente:

•	1 Ambiente vs 2 ambientes: 156.660 ARS de diferencia, es decir un 34.83%

•	2 Ambientes vs 3 ambientes: 307.366 ARS de diferencia, es decir un 50.68%

•	3 Ambientes vs 1 ambiente: 464.026 ARS de diferencia, es decir un 103.15%

Se usó el último año en esta respuesta porque permite analizar la situación actual del mercado, evitando comparaciones intertemporales afectadas por inflación acumulada.

La brecha más grande la encontramos entre un departamento de 3 ambientes que es significativamente superior al de 1 ambiente, con un 103.15% de diferencia. Por otro lado, la brecha menor fue entre los departamentos de 1 y 2 ambientes con un 34.83% de diferencia.

Hay que destacar que esta estructura de precios se mantuvo consistente a lo largo del periodo analizado, esto sugiere que, pese al fuerte crecimiento nominal, la relación de precios entre tipos de unidades se mantuvo relativamente constante en el tiempo.

Los incrementos presentados corresponden a variaciones nominales entre ambientes, no se tiene en cuenta ajustes por inflación.

5.3. ¿Qué tipos de inmuebles son los más publicados y cuáles dominan la oferta?

Para responder esta pregunta debemos saber cuáles han sido los inmuebles que más han dominado la oferta históricamente (2018-2025), en ese sentido, nos encontramos que:

•	1 ambiente: 25.38%

•	2 ambientes: 42.52%

•	3 ambientes: 23.09%

•	4 y 5 ambientes: 9.02%

Tras estos resultados, también encontramos que el 89.59% de las publicaciones fueron de departamentos usados, mientras que el 10.41% fueron nuevos.

Pero, como en la respuesta anterior, necesitamos la situación actual del mercado para evitar distorsiones por distintos indicadores económicos, por lo que al analizar el 2025 quedamos así:

•	1 ambiente: 32.8%

•	2 ambientes: 42.16%

•	3 ambientes: 19.29%

•	4 y 5 ambientes: 5.76%

Además, encontramos que en el año 2025 el 89.12% de publicaciones fueron departamentos usados, mientras que el 10.88% fueron nuevos.

Podemos ver que la oferta de departamentos de 1 ambiente ha aumentado en el tiempo, el valor histórico es de 25.38% mientras que para el 2025 el valor asciende a un 32.8% de la oferta, por su parte, la de 3 ambientes se ha reducido un poco, el valor histórico es de 23.09% y en el 2025 fue de 19.29%, en otro punto, la oferta de 2 ambientes se ha mantenido estable en el tiempo en un 42%, es la más consistente de todas.

Más allá de porcentajes, en términos prácticos, la mayor oferta se concentra principalmente en unidades de 2 ambientes, por otro lado, las unidades de 4 y 5 ambientes presentan una participación mucho menor.

Esto indica que, pese a los cambios en las publicaciones, la brecha entre inmuebles usados y nuevos se mantuvo relativamente estable en el tiempo.

Nota: Si una persona quiere buscar departamentos, le va a resultar más rápido conseguir una buena oferta de departamentos de 2 ambientes que una de 4 o más ambientes.

5.4. ¿Cuáles son los barrios que más han aumentado en el tiempo?

Para responder a esta pregunta debemos tomar el precio promedio inicial del primer trimestre (2018) y el precio del último trimestre del periodo (2025) para poder hacer un porcentaje.

Para los distintos ambientes los resultados son los siguientes:

3 ambientes:

•	Barrio Flores con un aumento de 6923,71%

•	Barrio Núñez con un aumento de 6511.00%

•	Barrio Caballito con un aumento de 6026.05%

2 ambientes:

•	Barrio Villa Devoto aumentó un 6507.00%

•	Barrio Caballito aumentó un 6446.02%

•	Barrio Villa del Parque aumentó un 6421.80%

1 ambiente:

•	Barrio Belgrano aumentó un 6190.86%

•	Barrio Flores aumentó un 6125.24%

•	Barrio Villa Urquiza aumentó un 6036.48%

Se consideraron únicamente barrios con datos completos en ambos extremos del período.

Se puede notar que, a diferencia de los precios nominales, los barrios con mayor crecimiento relativo no coinciden necesariamente con los más caros, lo que sugiere una convergencia de precios entre zonas. Esta tendencia se mantiene en todos los ambientes.

Nota: Estos incrementos no necesariamente implican que sean los barrios más caros, sino aquellos con mayor crecimiento relativo. 

5.5. ¿Cuáles son los barrios con más y menor variación porcentual en los precios en 2025?

Para calcular estos registros debemos tomar únicamente los datos del 2025, por lo que se van a excluir del análisis los barrios que no cumplan con el 100% de los datos, sin embargo, es bueno mencionar que por la naturaleza de los datos solamente tenemos los primeros 3 trimestres del año, por lo que aún falta el valor del último trimestre, se puede incluir en un futuro proyecto o extensión del mismo.

Ahora sí, los barrios con menos aumentos porcentuales son los siguientes:

3 ambientes:

•	Barrio Villa Crespo con un 3.29%

•	Barrio Balvanera con un 6.75%

•	Barrio Retiro con un 9.57%

2 ambientes:

•	Barrio Villa Devoto con un 8.81%

•	Barrio Retiro con un 10.41%

•	Barrio Caballito con un 11.02%

1 ambiente:

•	Barrio Balvanera con un 6.34%

•	Barrio Almagro con un 12.30%

•	Barrio Palermo con un 12.59%

Ahora, los barrios con más aumentos porcentuales son los siguientes:

3 ambientes:

•	Barrio Núñez con un 24.18%

•	Barrio Caballito con un 17.89%

•	Barrio Palermo con un 17.79%

2 ambientes:

•	Barrio Núñez con un 23.49%

•	Barrio Balvanera con un 21.38%

•	Barrio San Cristóbal con un 20.90%

1 ambiente:

•	Barrio Belgrano con un 23.83%

•	Barrio Núñez con un 19.56%

•	Barrio Villa Crespo con un 15.93%

Se evidencia que los barrios con menos variación porcentual se ubican al sur de la ciudad, sin embargo, no es una tendencia que sea netamente geográfica, también depende de otros factores como: crecimiento económico, desarrollo urbanístico y/o aumento de la demanda, que no son tomados en cuenta acá, pero que sirven para tomar contexto.

Nota: Esta información puede ser relevante para aquellas personas que desean buscar barrios donde no se den aumentos de manera constante, esto no quiere decir que los precios sean los más bajos.

5.6. ¿Cuáles son hoy los barrios más caros y más baratos para alquilar? 

Para responder a esta pregunta debemos identificar los precios por ambientes, así que haremos un ranking de los 3 más caros y baratos por barrio.

Además, debemos tomar en cuenta el tercer trimestre del año 2025 ya que es la información más actualizada del dataset, por lo que estos valores pueden presentar variaciones a la fecha.

3 ambientes más caros de la ciudad:

•	Barrio Núñez con un valor promedio mensual de 1.127.910 ARS.

•	Barrio Palermo con un valor promedio mensual de 1.046.860 ARS.

•	Barrio Villa Urquiza con un valor promedio mensual de 1.016.530 ARS.

2 ambientes más caros de la ciudad:

•	Barrio Núñez con un valor promedio mensual de 710.560 ARS.

•	Barrio Palermo con un valor promedio mensual de 678.281 ARS.

•	Barrio Belgrano con un valor promedio mensual de 663.206 ARS.

1 ambiente más caros de la ciudad:

•	Barrio Belgrano con un valor promedio mensual de 508.881 ARS.

•	Barrio Núñez con un valor promedio mensual de 495.716 ARS.

•	Barrio Palermo con un valor promedio mensual de 491.732 ARS.

3 ambientes más baratos de la ciudad:

•	Barrio Balvanera con un valor promedio mensual de 803.412 ARS.

•	Barrio Retiro con un valor promedio mensual de 854.611 ARS.

•	Barrio Flores con un valor promedio mensual de 879.817 ARS.

2 ambientes más baratos de la ciudad:

•	Barrio San Nicolás con un valor promedio mensual de 539.809 ARS.

•	Barrio San Cristóbal con un valor promedio mensual de 542.045 ARS.

•	Barrio Flores con un valor promedio mensual de 545.310 ARS.

1 ambiente más baratos de la ciudad:

•	Barrio Balvanera con un valor promedio mensual de 405.134 ARS.

•	Barrio Flores con un valor promedio mensual de 418.243 ARS.

•	Barrio San Nicolás con un valor promedio mensual de 431.199 ARS.

Se observa que los barrios más caros tienden a concentrarse en el norte de la ciudad, mientras que los más accesibles se ubican mayormente en zonas centrales y del oeste.

Nota: esta información puede ser relevante para aquellas personas que deseen buscar alquileres más accesibles.

6. Insights

Los hallazgos más relevantes son:

•	Se observa una tendencia general de crecimiento en los precios de alquiler en los distintos ambientes durante el periodo analizado, con un 6.400% de crecimiento promedio en los precios.

•	Hay una marcada y notable diferencia entre los precios de departamentos de distintos ambientes, la mayor brecha está entre departamentos de 3 y 1 ambiente.

•	Los departamentos de 2 ambientes son los que dominan el mercado con un 41% de la oferta, mientras que los departamentos de 4 y 5 ambientes tienen el menor rango de participación. La tendencia de tipos de departamentos que más ha aumentado es la de 1 ambientes, mientras que la que más se ha reducido es la de 4 y 5 ambientes.

•	La volatilidad se evidencia no solo en el nivel de precios, sino también en la variación trimestral, con mayores amplitudes desde 2022, en especial para los 1 ambientes, lo que nos indica que la demanda y la oferta por estos departamentos va en aumento.

•	Se observa que en el 2025 hubo una desaceleración en los aumentos de los precios con respecto a años anteriores.

•	Hay una marcada segmentación territorial donde se divisan los barrios más caros y los más baratos.

•	El mercado presenta una expansión nominal acelerada, con una estructura de precios que mantiene relaciones proporcionales estables entre ambientes.

El mercado de alquiler en CABA muestra una recomposición desigual, si bien el crecimiento acumulado en los precios de alquiler fue similar entre ambientes la variación porcentual anual en 2025 mostró diferencias territoriales significativas entre barrios. Podemos concluir que este mercado ha estado muy cambiante en los últimos años y se ha mantenido una tendencia de aumento generalizado de precios, reflejando un escenario altamente dinámico y volátil.

7. Limitaciones

Como estos datos son extraídos de portales inmobiliarios (Argenprop) y recogidos por el IDECBA nos encontramos con las siguientes limitaciones:

•	Los precios analizados corresponden a valores de publicación, pero no son precios finales de cierre, que son muy cambiantes.

•	No se incorporan variables macroeconómicas externas (inflación, salarios). Se recomienda interpretar los resultados considerando el contexto macroeconómico.

•	El análisis por barrio es exclusivamente con departamentos (1, 2 y 3 ambientes) y no incluye otros tipos.

•	Algunos datos del último trimestre del 2025 no están disponibles.

•	Algunos datos en general en 2025 pueden presentar pequeñas variaciones en un futuro debido al retraso de la actualización en la página de extracción de los datos.

•	Para calcular el promedio en el precio se usaron medidas estándares para cada ambiente, esto quiere decir que los valores pueden cambiar según la superficie total (m2) en cada barrio.

Estas limitaciones no invalidan el análisis, pero deben ser resaltadas para interpretar de una mejor manera el resultado.

8. Próximos pasos

•	Incorporar datos de ingresos promedio para analizar la accesibilidad al alquiler.

•	Comparar al mercado de alquiler vs compra

•	Analizar el impacto de cambios en leyes, demandas, trabas burocráticas, inflación…

•	Profundizar el análisis espacial con mapas detallados (movilidad urbana, zonas económicas, etc…)

•	Aplicación de modelos predictivos para estimación de precios futuros.

9. Herramientas

•	Excel y Power Query (Limpieza)

•	SQL (consultas y agregaciones)

•	Power BI (dashboard y visualización)

•	GitHub (documentación y versionado)

10. Nota final.

Este proyecto fue desarrollado con fines educativos y de portfolio, aplicando criterios de análisis de datos orientados a negocio y toma de decisiones. Esto demuestra el uso de Power Query para transformar los datos, MySQL para consultas analíticas y responder preguntas, Power BI para visualización orientada a la toma de decisiones.
