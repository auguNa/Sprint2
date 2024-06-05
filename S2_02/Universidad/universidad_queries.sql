-- 1.Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. 
-- El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT   persona.apellido1, persona.apellido2, persona.nombre as "nombre"
FROM
persona
WHERE tipo = "alumno"
ORDER BY apellido1 ASC;

-- 2.Alumnos que no han dado de alta su número de teléfono
SELECT nombre, apellido1, apellido2 
FROM persona 
WHERE tipo = "alumno" AND telefono IS NULL;

-- 3.Alumnos nacidos en 1999
SELECT *
FROM persona
WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;

-- 4.Profesores/as que no han dado de alta su teléfono y cuyo NIF termina en 'K'
SELECT nombre, apellido1, apellido2, nif
FROM persona
WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE  "%k%";

-- 5.Asignaturas del primer cuatrimestre en el tercer curso del grado con ID 7
SELECT nombre 
FROM asignatura 
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6.Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados. 
-- El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. 
-- El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
SELECT  persona.apellido1 as "primer apellido", persona.apellido2 as "segundo apellido", persona.nombre as "nombre", departamento.nombre as "nom del departament"
from persona
JOIN profesor ON profesor.id_profesor = persona.id
JOIN departamento ON  departamento.id = profesor.id_departamento
WHERE persona.tipo = "profesor"
ORDER BY persona.apellido1 ASC;

-- 7.Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT asignatura.nombre as "assignatura", curso_escolar.anyo_inicio, curso_escolar.anyo_fin
FROM persona
JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id
JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE persona.tipo = "alumno" and persona.nif = "26902806M";

-- 8.Departamentos con profesores/as que imparten en el Grado en Ingeniería Informática (Plan 2015)
SELECT departamento.nombre as "nombre departamento", asignatura.nombre, profesor.id_profesor, grado.nombre
FROM departamento
JOIN profesor ON profesor.id_departamento = departamento.id
JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor
JOIN grado ON grado.id = asignatura.id_grado
WHERE asignatura.id_grado =4;

-- 9.Alumnos matriculados en alguna asignatura durante el curso 2018/2019
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2, curso_escolar.anyo_inicio, curso_escolar.anyo_fin 
FROM persona
JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id
JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
 WHERE curso_escolar.anyo_fin = 2019 and curso_escolar.anyo_inicio = 2018;

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1.Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. 
-- El listado también debe mostrar aquellos profesores/as que no tienen ningún departamento asociado. 
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. 
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.
SELECT departamento.nombre as "nombre departamento", persona.apellido1 as "primer cognom", persona.apellido2 as "segon cognom", persona.nombre, persona.id
FROM persona
LEFT JOIN profesor ON profesor.id_profesor = persona.id
LEFT JOIN departamento ON departamento.id = profesor.id_departamento
WHERE persona.tipo = "profesor"
ORDER BY  departamento.nombre ASC;

-- 2.Profesores/as que no están asociados a un departamento
SELECT departamento.nombre as "nombre departamento", persona.apellido1 as "primer cognom", persona.apellido2 as "segon cognom", persona.nombre, persona.id
FROM persona
LEFT JOIN profesor ON profesor.id_profesor = persona.id
LEFT JOIN departamento ON departamento.id = profesor.id_departamento
WHERE departamento.nombre IS NULL AND persona.tipo ="profesor"
ORDER BY  departamento.nombre ASC;

-- 3.Departamentos sin profesores asociados
SELECT departamento.nombre , profesor.id_profesor
FROM departamento
LEFT JOIN profesor ON profesor.id_departamento = departamento.id
WHERE profesor.id_profesor IS NULL;


-- 4.Profesores/as que no imparten ninguna asignatura
SELECT persona.nombre as "nombre", persona.apellido1 as "prim cognom", persona.apellido2 as "segon cognom", asignatura.nombre as "asignatura"
FROM persona
LEFT JOIN asignatura ON asignatura.id_profesor = persona.id
WHERE persona.tipo = "profesor" and asignatura.nombre IS NULL;

-- 5.Asignaturas sin profesor/a asignado
SELECT asignatura.nombre, asignatura.id_profesor
FROM asignatura 
WHERE id_profesor IS NULL;

-- 6.Departamentos que no han impartido asignaturas en ningún curso escolar
SELECT departamento.nombre as "departamento"
 ,asignatura.nombre as "asignatura"
FROM departamento
LEFT JOIN profesor ON profesor.id_departamento = departamento.id
LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor
WHERE profesor.id_profesor IS NULL;

-- Consultas resumen:
-- 1.Número total de alumnos existentes
SELECT COUNT(*) AS total_alumnos 
FROM persona
WHERE tipo = "alumno";

-- 2.Alumnos nacidos en 1999
SELECT COUNT(*) AS "Total alumnes de 1999"
FROM persona
WHERE YEAR(fecha_nacimiento) = 1999 and tipo = "alumno";

-- 3.Calcula cuántos profesores/as hay en cada departamento. 
-- El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento. 
-- El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y tendrá que estar ordenado de mayor a menor por el número de profesores/as.
SELECT 
departamento.nombre as "departamento", COUNT(DISTINCT profesor.id_profesor) as "no prof"
FROM departamento
JOIN profesor ON profesor.id_departamento = departamento.id
GROUP BY departamento.nombre
ORDER BY COUNT(profesor.id_profesor) DESC;

-- 4.Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. 
-- Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. 
-- Estos departamentos también deben aparecer en el listado.
SELECT
departamento.nombre as "departamento", COUNT(DISTINCT profesor.id_profesor) as "nr profe"
FROM departamento
LEFT JOIN profesor ON profesor.id_departamento = departamento.id
GROUP BY departamento.nombre
ORDER BY COUNT(profesor.id_profesor) DESC;

-- 5.Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
-- Ten en cuenta que pueden existir grados que carecen de asignaturas asociadas. 
-- Estos grados también deben aparecer en el listado. 
-- El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT DISTINCT grado.nombre as "grado"
 , COUNT(asignatura.id_grado) as "total asignaturas"
FROM grado
LEFT JOIN asignatura ON asignatura.id_grado = grado.id
 GROUP BY grado.nombre  order by COUNT(asignatura.id_grado) DESC;

-- 6.Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT grado.nombre as "grado", COUNT(asignatura.id_grado) as "asignatura" 
 FROM grado
 JOIN asignatura ON asignatura.id_grado = grado.id
 GROUP BY grado.nombre
 HAVING COUNT(asignatura.id_grado) > 40
 order by COUNT(asignatura.id_grado) DESC;

-- 7.Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos existentes para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.
 SELECT 
  grado.nombre AS "grado", 
  asignatura.nombre AS "tipo_assignatura", 
  SUM(asignatura.creditos) AS "creditos"
FROM grado
JOIN  asignatura ON asignatura.id_grado = grado.id
GROUP BY 
  grado.nombre,
  asignatura.nombre
ORDER BY 
  grado.nombre,
  asignatura.nombre;

-- 8.Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado tendrá que mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT curso_escolar.anyo_inicio as "Inicio", COUNT(alumno_se_matricula_asignatura.id_alumno) as "no alumnos"
 FROM  curso_escolar
 JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
 group by curso_escolar.anyo_inicio;

-- 9. Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT 
 persona.id as "id", persona.nombre as "nombre", 
 persona.apellido1 as "primer cognom", persona.apellido2 as "segon cognom", 
 COUNT(asignatura.nombre) as "asignatura"
 FROM persona
 LEFT JOIN asignatura ON asignatura.id_profesor = persona.id
group by persona.id, persona.apellido1
 order by COUNT(asignatura.nombre) DESC;

-- 10.Datos del alumno/a más joven
SELECT * 
from
persona
where tipo ="alumno"
order by fecha_nacimiento DESC
limit 1;

-- 11.Profesores/as con departamento asociado que no imparten ninguna asignatura
SELECT persona.nombre as "profe", departamento.nombre as "departamento"
, asignatura.nombre as "asignatura"
FROM persona
JOIN profesor ON profesor.id_profesor = persona.id
JOIN departamento ON departamento.id = profesor.id_departamento
left JOIN asignatura ON asignatura.id_profesor = persona.id and asignatura.id_profesor is null
