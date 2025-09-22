CREATE DATABASE RH_Empresa;

USE RH_Empresa;

CREATE TABLE colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL
);

INSERT INTO colaboradores (nome, cargo, departamento, salario, data_admissao) VALUES
('Ana Silva', 'Analista de RH', 'Recursos Humanos', 2500.00, '2022-03-15'),
('João Souza', 'Desenvolvedor', 'Tecnologia', 1800.00, '2023-01-10'),
('Maria Oliveira', 'Gerente de Projetos', 'Tecnologia', 4500.00, '2021-07-01'),
('Pedro Santos', 'Assistente Administrativo', 'Administrativo', 1700.00, '2023-09-05'),
('Carla Pereira', 'Coordenadora de Marketing', 'Marketing', 3200.00, '2020-11-20');

SELECT * FROM colaboradores
WHERE salario > 2000;

SELECT * FROM colaboradores
WHERE salario < 2000;

UPDATE colaboradores
SET salario = 2100.00
WHERE nome = 'João Souza';
