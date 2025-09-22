CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    borda_recheada BOOLEAN NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('Tradicional', 'Sabores clássicos mais pedidos'),
('Premium', 'Sabores especiais e diferenciados'),
('Doce', 'Pizzas doces para sobremesa'),
('Vegetariana', 'Sem carnes, com vegetais e queijos'),
('Promocional', 'Opções em promoção');

INSERT INTO tb_pizzas (nome, tamanho, preco, borda_recheada, categoria_id) VALUES
('Calabresa', 'Grande', 42.00, TRUE, 1),
('Mussarela', 'Média', 38.00, FALSE, 1),
('Frango com Catupiry', 'Grande', 48.00, TRUE, 2),
('Portuguesa', 'Grande', 50.00, FALSE, 1),
('Chocolate', 'Pequena', 30.00, TRUE, 3),
('Prestígio', 'Média', 35.00, FALSE, 3),
('Vegetariana Especial', 'Grande', 46.00, TRUE, 4),
('Promo Pepperoni', 'Média', 29.90, FALSE, 5);

SELECT * FROM tb_pizzas
WHERE preco > 45.00;

SELECT * FROM tb_pizzas
WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas
WHERE nome LIKE '%m%' OR nome LIKE '%M%';

SELECT p.id, p.nome AS pizza, p.tamanho, p.preco, p.borda_recheada,
       c.nome AS categoria, c.descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

SELECT p.id, p.nome AS pizza, p.tamanho, p.preco, p.borda_recheada,
       c.nome AS categoria, c.descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Doce';
