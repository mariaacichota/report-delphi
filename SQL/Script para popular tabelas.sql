INSERT INTO departamentos (nm_departamento, local) VALUES
('Cardiologia', 'Porto Alegre'),
('Neurologia', 'São Paulo'),
('Ortopedia', 'Porto Alegre'),
('Pediatria', 'Rio de Janeiro'),
('Oncologia', 'Curitiba');

INSERT INTO empregados (
    cod_departamento, cod_emp_funcao, nm_empregado, 
    nm_funcao, data_admissao, salario, comissao
) VALUES
(1, 201, 'Marcelo Tavares', 'Gerente', '2015-03-10', 9500.00, 500.00),
(1, 202, 'Carla Silva', 'Enfermeira', '2019-08-15', 4200.00, 200.00),
(2, 203, 'Tatiane Ribeiro', 'Médico', '2016-01-20', 11200.00, 0.00),
(2, 204, 'João Pedro', 'Técnico', '2022-04-12', 2800.00, 0.00),
(3, 205, 'Letícia Martins', 'Gerente', '2017-10-05', 8800.00, 300.00),
(3, 206, 'Roberto Teixeira', 'Enfermeiro', '2020-02-19', 3900.00, 150.00),
(4, 207, 'Aline Torres', 'Médica', '2018-07-23', 10000.00, 400.00),
(4, 208, 'Fernando Costa', 'Técnico', '2023-01-10', 2600.00, 0.00),
(5, 209, 'Bruna Souza', 'Gerente', '2014-11-01', 9800.00, 600.00),
(5, 210, 'Tiago Nunes', 'Enfermeiro', '2019-06-30', 4300.00, 250.00);