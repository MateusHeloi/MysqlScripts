CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    classe_id BIGINT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Especialista em combate corpo a corpo'),
('Mago', 'Utiliza magias poderosas'),
('Arqueiro', 'Habilidoso com arco e flecha'),
('Ladino', 'Ágil e furtivo'),
('Clérigo', 'Suporte e cura para o grupo');

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Thorin', 2500, 1500, 10, 1),
('Elrond', 1800, 1200, 8, 2),
('Legolas', 2200, 1000, 9, 3),
('Arwen', 1600, 1400, 7, 5),
('Shadow', 1900, 800, 6, 4),
('Gimli', 2000, 1700, 9, 1),
('Merlin', 3000, 900, 12, 2),
('Robin', 1700, 1100, 5, 3);

SELECT * FROM tb_personagens
WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens
WHERE nome LIKE '%c%' OR nome LIKE '%C%';

SELECT p.id, p.nome AS personagem, p.poder_ataque, p.poder_defesa, p.nivel,
       c.nome AS classe, c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;

SELECT p.id, p.nome AS personagem, p.poder_ataque, p.poder_defesa, p.nivel,
       c.nome AS classe, c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro';
