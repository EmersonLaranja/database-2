--1-Pré-requisitos diretos da disciplina de Sinais e Sistemas (ELE16191)

SELECT title
FROM course
WHERE course_id IN(

SELECT prereq_id
FROM prereq 
WHERE course_id='ELE16191')


--2-Disciplinas que têm CÁLCULO III (MAT15936) como pré-requisito direto
SELECT title
FROM course
WHERE course_id IN (

SELECT course_id
FROM prereq
WHERE prereq_id='MAT15936'
)

--3-Pré-requisitos dos pré-requisitos da disciplina ELE16191
SELECT title,course_id
FROM course
WHERE course_id IN(


SELECT t2.prereq_id
FROM prereq AS t1 JOIN prereq as T2 ON t1.prereq_id=t2.course_id
WHERE t1.course_id='ELE16191'

)
--4-Disciplinas que têm como pré-requisitos disciplinas que têm MAT15936 como pré-requisito
WITH t1 AS 
(SELECT *
FROM prereq
WHERE prereq_id='MAT15936'
),
t2 AS (SELECT p.course_id
FROM t1 JOIN prereq p ON t1.course_id=p.prereq_id
)

SELECT * FROM t2,course c WHERE c.course_id=t2.course_id

--5-Todas as disciplinas que têm MAT15936 como pré-requisito direto ou indireto
WITH RECURSIVE t1 AS(
SELECT course_id
FROM prereq
WHERE prereq_id='MAT15936'
UNION ALL
SELECT prereq.course_id
FROM t1 JOIN prereq ON t1.course_id=prereq.prereq_id
)
SELECT * FROM t1;
--6-Disciplinas com número total de disciplinas das quais é pré-requisito direto ou indireto
SET statement_timeout=1000;

WITH RECURSIVE t1 AS(
SELECT prereq_id AS course_id, course_id AS dependant_id
FROM prereq

UNION
SELECT t1.course_id,p.course_id
FROM t1 JOIN prereq p ON t1.dependant_id=p.prereq_id
)

SELECT t1.course_id, count(*) AS num_courses
FROM t1 
GROUP BY course_id

--Material de apoio: https://www.postgresql.org/docs/current/queries-with.html
