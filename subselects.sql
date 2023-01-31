-- subselect

-- descobrir todos atores que fizeram o filme com seguintes parametros
-- film_id= 1 com tile= ACADEMY DINOSAUR
-- conhecer a estrura das tabelas alvo


select * from EMPLOYEES;
select * from JOB_HISTORY;
select * from DEPARTMENTS;
select * from JOBS; 


-- EXEMPLO DE SUBSELECT 1 OPERADOR IN - só os colaboradores que tem historico de trabalho
select * from EMPLOYEES a
where a.employee_id in (select b.employee_id from JOB_HISTORY b); 


SELECT a.nome,c.nome_disc,b.periodo
    FROM alunos a
	INNER JOIN matricula b 
		ON a.id_aluno=b.id_aluno
	INNER JOIN disciplina c 
		ON b.id_disciplina=c.id_disciplina;
                       


-- EXEMPLO DE SUBSELECT 2 OPERADOR IN 
select * from EMPLOYEES a
where a.manager_id='100'
and a.employee_id in (select b.employee_id from JOB_HISTORY b);

-- EXEMPLO DE SUBSELECT 3 OPERADOR IN 
select * from EMPLOYEES a
where  a.employee_id in (select b.employee_id from JOB_HISTORY b
                         where b.DEPARTMENT_ID='50');


select * from JOB_HISTORY b where b.DEPARTMENT_ID='50'
---
-- EXEMPLO DE SUBSELECT 4 OPERADOR NOT IN 
select * from EMPLOYEES a
where a.employee_id NOT in (select b.employee_id from JOB_HISTORY b); 
                       


-- EXEMPLO DE SUBSELECT 5 OPERADOR NOT IN 
select * from EMPLOYEES a
where a.manager_id='100'
and a.employee_id NOT in (select b.employee_id from JOB_HISTORY b);

-- EXEMPLO DE SUBSELECT 3 OPERADOR NOT IN 
select * from EMPLOYEES a
where  a.employee_id NOT in (select b.employee_id from JOB_HISTORY b
                         where b.DEPARTMENT_ID='50');


--SUBSELECT RETORNANDO COLUNA

SELECT a.employee_id,
       a.first_name,
       a.job_id,
       (select b.job_title from jobs b where a.job_id=b.job_id) as cargo
from EMPLOYEES a;


--SUBSELECT RETORNANDO COLUNA
SELECT a.employee_id,
       a.first_name,
       a.DEPARTMENT_ID,
      (select b.DEPARTMENT_NAME from DEPARTMENTS b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) as Depto
from EMPLOYEES a;
 
--SUBSELECT RETORNANDO COLUNA
SELECT a.DEPARTMENT_ID,
       a.DEPARTMENT_NAME,
        a.MANAGER_ID,
       (SELECT b.first_name from EMPLOYEES b where a.manager_id=b.employee_id) AS NOME_GER
FROM DEPARTMENTS a;

--SUBSELECT COM VALOR AGREGADO SOMA

SELECT a.DEPARTMENT_ID,
       a.DEPARTMENT_NAME,
       (SELECT SUM(b.salary) from EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) salario_depto
FROM DEPARTMENTS a;
 
 
--SUBSELECT COM VALOR AGREGADO SOMA

SELECT a.DEPARTMENT_ID,
       a.DEPARTMENT_NAME,
(SELECT SUM(b.salary) from EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) salario_depto,
(SELECT count(*) from EMPLOYEES b   where a.DEPARTMENT_ID=b.DEPARTMENT_ID) qtd_func
FROM DEPARTMENTS a;

--SELLECT
SELECT a.DEPARTMENT_ID,
       a.DEPARTMENT_NAME,
--calculo total salario
(SELECT SUM(b.salary) from EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) salario_depto,
 --calculo qtd funcioanario
(SELECT count(*) from EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) qtd_func,
 --media
 (SELECT SUM(b.salary) from EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) 
   / --operador matematico
(SELECT count(*) from EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) media
FROM DEPARTMENTS a;


