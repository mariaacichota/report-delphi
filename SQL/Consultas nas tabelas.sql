SELECT nm_empregado, nm_funcao, data_admissao 
FROM empregados
ORDER BY salario DESC;

SELECT nm_empregado, data_admissao 
FROM empregados
WHERE cod_departamento = (
   						  SELECT cod_departamento
       					  FROM empregados
        				  WHERE nm_empregado LIKE 'Marcelo%'
    					 )
      AND nm_empregado NOT LIKE 'Marcelo%';

SELECT id_empregado, nm_empregado
FROM empregados
WHERE cod_departamento IN (
        				   SELECT DISTINCT cod_departamento
       					   FROM empregados
      					   WHERE nm_empregado LIKE '%t%'
                          );

SELECT e.nm_empregado, d.nm_departamento, d.local, e.nm_funcao
FROM empregados e
	JOIN departamentos d ON e.cod_departamento = d.id_departamento
WHERE e.data_admissao < CURRENT_DATE - INTERVAL '5 years'
      AND e.salario > (
        			   SELECT MIN(salario)
        			   FROM empregados
        			   WHERE nm_funcao = 'Gerente'
        			  );

SELECT d.nm_departamento, e.nm_funcao, SUM(e.salario) AS soma_salarios
FROM empregados e
	JOIN departamentos d ON e.cod_departamento = d.id_departamento
WHERE e.data_admissao  < CURRENT_DATE - INTERVAL '1 year'
      AND d.local = 'Porto Alegre'
GROUP BY d.nm_departamento, e.nm_funcao;


