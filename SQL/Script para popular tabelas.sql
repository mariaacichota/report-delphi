INSERT INTO departamentos (id_departamento, nm_departamento, local) VALUES
(1, 'Cardiologia', 'Porto Alegre'),
(2, 'Neurologia', 'São Paulo'),
(3, 'Ortopedia', 'Porto Alegre'),
(4, 'Pediatria', 'Rio de Janeiro'),
(5, 'Oncologia', 'Curitiba');

INSERT INTO empregados (
    id_empregado, cod_departamento, cod_emp_funcao, nm_empregado, 
    nm_funcao, data_admissao, salario, comissao
) VALUES
(101, 1, 201, 'Marcelo Tavares', 'Gerente', '2015-03-10', 9500.00, 500.00),
(102, 1, 202, 'Carla Silva', 'Enfermeira', '2019-08-15', 4200.00, 200.00),
(103, 2, 203, 'Tatiane Ribeiro', 'Médico', '2016-01-20', 11200.00, 0.00),
(104, 2, 204, 'João Pedro', 'Técnico', '2022-04-12', 2800.00, 0.00),
(105, 3, 205, 'Letícia Martins', 'Gerente', '2017-10-05', 8800.00, 300.00),
(106, 3, 206, 'Roberto Teixeira', 'Enfermeiro', '2020-02-19', 3900.00, 150.00),
(107, 4, 207, 'Aline Torres', 'Médica', '2018-07-23', 10000.00, 400.00),
(108, 4, 208, 'Fernando Costa', 'Técnico', '2023-01-10', 2600.00, 0.00),
(109, 5, 209, 'Bruna Souza', 'Gerente', '2014-11-01', 9800.00, 600.00),
(110, 5, 210, 'Tiago Nunes', 'Enfermeiro', '2019-06-30', 4300.00, 250.00);