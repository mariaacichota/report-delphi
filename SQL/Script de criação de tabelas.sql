CREATE TABLE departamentos (
    id_departamento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nm_departamento VARCHAR(100) NOT NULL,
    local VARCHAR(100)
);

CREATE TABLE empregados (
    id_empregado INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cod_departamento INTEGER REFERENCES departamentos(id_departamento),
    cod_emp_funcao INTEGER,
    nm_empregado VARCHAR(100) NOT NULL,
    nm_funcao VARCHAR(100),
    data_admissao DATE,
    salario NUMERIC(9,2),
    comissao NUMERIC(9,2)
);


