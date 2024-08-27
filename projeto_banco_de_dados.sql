--3. SQL de criação das tabelas
CREATE TABLE  categorias(
cod_categoria SERIAL PRIMARY KEY,
nome VARCHAR (100) NOT NULL UNIQUE,
descricao TEXT
);

CREATE TABLE funcionarios(
cod_funcionario SERIAL PRIMARY KEY,
nome VARCHAR (15) NOT NULL, 
sobrenome VARCHAR(100) NOT NULL,
usuario_funcionario VARCHAR(10) NOT NULL,
cpf VARCHAR(20)
);

CREATE TABLE produtos(
cod_produto SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL UNIQUE,
descricao TEXT,
data_fabricacao DATE DEFAULT CURRENT_DATE,
valor_unitario NUMERIC(10, 2),
cod_categoria INTEGER REFERENCES categorias(cod_categoria),
cod_funcionario INTEGER REFERENCES funcionarios(cod_funcionario)
);

CREATE TABLE enderecos(
cod_endereco SERIAL PRIMARY KEY,
rua VARCHAR(100) NOT NULL,
numero_casa VARCHAR(20),
cep VARCHAR(10) NOT NULL,
cidade VARCHAR(50)NOT NULL,
bairro VARCHAR(50) NOT NULL,
complemento VARCHAR(50),
estado VARCHAR(2)NOT NULL
);

CREATE TABLE clientes(
cod_cliente SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
sobrenome VARCHAR(100)NOT NULL,
nome_usuario VARCHAR(10),
telefone VARCHAR(15),
email VARCHAR(100),
cpf VARCHAR(14) NOT NULL,
data_nascimento DATE NOT NULL,
cod_endereco INTEGER REFERENCES enderecos(cod_endereco)
);

CREATE TABLE pedidos(
cod_pedido SERIAL PRIMARY KEY,
cod_cliente INTEGER REFERENCES clientes(cod_cliente),
data_pedido DATE NOT NULL,
status VARCHAR(50) NOT NULL                           
);

CREATE TABLE pedido_item(
cod_pedido INTEGER REFERENCES pedidos(cod_pedido),
cod_produto INTEGER REFERENCES produtos(cod_produto),
quantidade INTEGER NOT NULL,
valor_unitario NUMERIC(10, 2),
status VARCHAR(50) NOT NULL,
valor_total NUMERIC(10, 2),
PRIMARY KEY (cod_pedido,cod_produto)
);


CREATE TABLE estoque(
cod_estoque SERIAL PRIMARY KEY,
cod_produto INTEGER REFERENCES produtos(cod_produto),
quantidade_produto INTEGER NOT NULL,
usuario_funcionario VARCHAR(10) NOT NULL,
data_entrada DATE,
data_saida DATE
);

--4. SQL de inserção de dados nas tabelas (pelo menos 5 registros em cada uma)
INSERT INTO categorias (nome, descricao) VALUES
('Vestuário', 'Roupas para o público feminino, masculino, infantil'),
('Calçados', 'Calçados para o público feminino, masculino, infantil'),
('Moda Íntima', 'Feminino, masculino, infantil'),
('Cama e mesa', 'Enxovais, lençóis, toalhas e afins...'),
('Acessórios', 'Bolsas, carteiras, joias e semijoias, cintos e afins...');

INSERT INTO funcionarios(nome,sobrenome,usuario_funcionario,cpf) VALUES 
('Renata','Rodrigues','RenataRod','123.456.789-10'),
('Andressa','Jandre','AndJandre','167.991.654-30'),
('Athirson','Inacio','AthInacio','321.654.987.78'),
('Gabriel','Siqueira','GabriSiq','123.654.897-99'),
('Milton','Rodrigues','MilRodri','109.876.543.21');

INSERT INTO produtos (nome, descricao, data_fabricacao, valor_unitario, cod_categoria, cod_funcionario) VALUES
('Tênis','Tênis Casual Feminino Recortes Retrô Confortável OBS: FORMA NORMAL.','2024-06-04', 79.99 ,'2','2'),
('Chinelo','Chinelo Havaianas Farm Leveza Tropical','2024-07-14', 80.93 ,'2','2'),
('Sandália','Rasteira Beira Rio Tiras Cruzadas Off-White LANÇAMENTO','2024-08-25', 40.00 ,'2','2'),
('Salto Alto','Scarpin Preto Verniz Salto Alto 12cm Sola Vermelha','2024-03-29', 299.90 ,'2','2'),
('Bota','Elegância e Conforto: A Bota Dakota de Cano Longo Preta, para mulheres que desejam combinar estilo e conforto.','2024-05-26', 320.00 ,'2','2'),
('Cobertor','Feito para proporcionar o máximo conforto, garantindo noites de sono agradáveis e aconchegantes','2024-07-02', 199.99 ,'4','4'),
('Toalha de banho','A Toalha Banhão banho 100% Algodão trazendo um volume inigualável','2024-08-01', 90.00 ,'4','4'),
('Edredom','Experimente o máximo de conforto e aconchego com o Edredom Dupla Face.','2024-08-05', 130.30 ,'4','4'),
('Toalha de mesa','A Toalha de Mesa protege sua mesa em todos os momentos. Seu material impermeável e térmico proporciona mais facilidade ao seu dia a dia','2024-07-25', 30.00 ,'4','4'),
('Lençol','Este Jogo de Lençol 400 Fios Ponto Palito é a escolha perfeita para quem busca elegância e qualidade em cada detalhe','2024-08-06', 40.97 ,'4','4'),
('Calcinhas','Diferentes níveis de cobertura e conforto, as calcinhas são peças cruciais do guarda-roupa íntimo feminino','2024-08-25', 5 ,'3','3'),
('Sutiãs','Os sutiãs oferecem suporte e modelagem aos seios','2024-08-24', 7.00 ,'3','3'),
('Camisolas','As camisolas são peças mais longas, geralmente usadas para dormir','2024-08-23', 30.00 ,'3','3'),
('Pijamas','Os pijamas são conjuntos de roupa de dormir que se compõem por uma blusa e uma calça ou shorts folgados','2024-07-21', 50.99 ,'3','3'),
('Cuecas','As cuecas são usadas por baixo de shorts ou calças, sendo a peça de roupa íntima mais importante para os homens','2020-10-20', 5.99 ,'3','3'),
('Camisa Feminina Manga Longa','Camisa feminina manga longa elaborada em sarja amaciada.','2024-06-30', 239.00 ,'1','1'),
('Vestido Curto Risca de Giz','Vestido curto em linho risca de giz, acinturado com um fechamento frontal por botões.','2024-06-30', 219.00 ,'1','1'),
('Camiseta Básica Masculina','Camiseta básica masculina manga curta slim, elaborada em malha de algodão.','2024-01-15', 59.99 ,'1','1'),
('Conjunto Curto Infantil','Composto pela blusa de manga curta unissex, tem modelagem regular e é confeccionada em malha macia.','2024-03-02', 79.99 ,'1', '1'),
('Calça Masculina Reta','Peça clássica de alfaiataria combinada com linho em padrões míni quadriculados','2024-06-30', 259.99 ,'1','1'),
('Kit Mochila Escolar Infantil','A Polo One é uma marca inspirada no estilo de vida dos americanos.','2024-05-11', 323.00 ,'5','5'),
('Kit Meia Infantil Puma Cano Curto 3 Pares - Branco+Cinza','O Kit Meia Infantil Puma Cano Curto 3 Pares concentra toda a atitude Puma em modelos que capturam esportividade e estilo.','2024-01-10', 27.99 ,'5','5'),
('Chapéu Boné Proteção Solar','Boné infantil Bebê Com Proteção Solar Uv com Aloe Vera PRODUTO INDISPENSÁVEL NAS BRINCADEIRAS AO AR LIVRE, PRAIA, PISCINA, MANGUEIRA NO QUINTAL, PARQUE, PASSEIOS.','2024-03-05', 59.90 ,'5','5'),
('Bola Plástica Líder Playcenter - Colorido','Com a Bola Plástica Líder Playcenter a diversão é garantida em qualquer lugar. Uma bola leve, fácil de encher e esvaziar e perfeita para crianças brincar dentro e fora de casa.','2023-02-11', 36.00 ,'5','5'),
('Meia Calça Infantil Lupo Cute Fio 70 Feminina - Rosa','Must have no guarda roupa infantil a Meia Calça Infantil Lupo Cute Fio 70 é perfeita para compor o visual básico das meninas modernas.','2023-12-29', 35.97 ,'5','5');

INSERT INTO enderecos (rua, numero_casa, cep, cidade, bairro, complemento, estado) VALUES
('Rua cachoeiras','n°52','25965-090','Teresópolis','Varzéa','ao lado do bar altas horas','RJ'),
('Rua das flores','casa2','36452-653','Petropólis','Valparaíso','em frente a praça vista alegre','RJ'),
('Rua das pimenteiras','657','26975-360','Teresópolis','Centro','muro verde, portão branco','RJ'),
('Estrada das conchas','nº36','75423-987','Rio de Janeiro','Lebron','em frente a praia','RJ'),
('Rua 7 de abril','1135','63479-257','São Paulo','Sorocaba','apartamento 3, bloco 5','SP');

INSERT INTO clientes (nome, sobrenome, nome_usuario, telefone, email, cpf, data_nascimento, cod_endereco) VALUES
('Nicolas','Theo','NickTheo','21975364578','nicolastheo@gmail.com','123.456.789-10','1990-05-16','1'),
('Maria','Santos','MariaSant','22976127636','mariasantos@gmail.com','097.456.147-50','2000-07-04','2'),
('Cristina','Silva','SilvaCris','21968582374','cristinadasilva@live.com','758.666.436-91','1987-12-23','3'),
('Fatima','Soares','FatimaSoar','24955623097','fatima_soares@outlook.com','894.665.321-50','1962-03-25','4'),
('Luciano','Fernandes','LucianoFer','21987463350','lucianofernandes1978@yahoo.com.br','789.321.456-54','1995-08-06','5');

INSERT INTO estoque (cod_produto, quantidade_produto, usuario_funcionario, data_entrada, data_saida) VALUES
('1','10','AndJandre','2024-03-06', NULL),
('2','20','AndJandre','2024-06-28', NULL),
('3','30','AndJandre','2024-08-28', NULL),
('4','40','AndJandre','2024-01-15', NULL),
('5','50','AndJandre','2024-01-07', NULL),
('6','60','GabriSiq','2023-11-14', NULL),
('7','70','GabriSiq','2024-08-09', NULL),
('8','80','GabriSiq','2023-10-06', NULL),
('9','90','GabriSiq','2024-03-26', NULL),
('10','100','GabriSiq','2024-02-05', NULL),
('11','110','AthInacio','2023-12-11', NULL),
('12','120','AthInacio','2024-05-14', NULL),
('13','130','AthInacio','2023-10-06', NULL),
('14','140','AthInacio','2024-03-29', NULL),
('15','150','AthInacio','2024-06-10', NULL),
('16','160','RenataRod','2024-03-27', NULL),
('17','170','RenataRod','2024-05-06', NULL),
('18','180','RenataRod','2023-04-14', NULL),
('19','190','RenataRod','2022-11-20', NULL),
('20','200','RenataRod','2024-05-30', NULL),
('21','210','MilRodri','2023-03-17', NULL),
('22','220','MilRodri','2023-12-24', NULL),
('23','230','MilRodri','2024-06-06', NULL),
('24','240','MilRodri','2022-11-29', NULL),
('25','250','MilRodri','2024-07-06', NULL);


--5. Um comando SQL de atualização em algum registro em uma tabela
-- Atualizando o preço de um produto
UPDATE produtos
SET nome = 'Chinelo', 
    valor_unitario = 90.00
WHERE cod_produto = 2;

SELECT * FROM produtos;

--6. Um comando SQL de exclusão de algum registro em uma tabela
-- SQL para exclusão de clientes 
DELETE FROM clientes
WHERE cod_cliente = 5;

-- Consultar os clientes e verificar a exclusão 
SELECT * FROM clientes;

--7. 5 SQLs de consulta
--a. Pelo menos 2 com algum tipo de junção
-- 1 Consultando todo o estoque após a mudança de preço 
SELECT
    p.nome AS nome,
    p.valor_unitario AS preco_unitario,
    e.quantidade_produto AS quantidade_em_estoque,
    (p.valor_unitario * e.quantidade_produto) AS valor_total_estoque
FROM
    produtos p
INNER JOIN
    estoque e ON p.cod_produto = e.cod_produto;

-- 2 Consultando o codigo do cliente com o endereço
SELECT 
    c.cod_cliente,
    c.nome,
    c.sobrenome,
    c.nome_usuario,
    c.telefone,
    c.email,
    c.cpf,
    c.data_nascimento,
    e.rua,
    e.numero_casa,
    e.cep,
    e.cidade,
    e.bairro,
    e.complemento,
    e.estado
FROM 
    clientes c
INNER JOIN 
    enderecos e ON c.cod_endereco = e.cod_endereco
WHERE 
    c.cod_cliente = 2; -- digitar o codigo do cliente que deseja consultar

--b. Pelo menos 1 com usando count() e group by() 
-- SQL para contar produtos cadastrandos dentro de categoria 
SELECT 
    c.nome AS categoria,
    COUNT(p.cod_produto) AS quantidade_produtos
FROM 
    produtos p
JOIN 
    categorias c ON p.cod_categoria = c.cod_categoria
GROUP BY 
    c.nome;

-- Verificar os produtos
SELECT * FROM produtos;

-- Inserindo um pedido
INSERT INTO pedidos (cod_cliente, data_pedido, status) VALUES 
('1', CURRENT_DATE ,'em processo de separação'),
('1',CURRENT_DATE, 'em processo de separação'),
('2', CURRENT_DATE ,'em processo de separação'),
('3', CURRENT_DATE,'em processo de separação');


-- Verificar o pedido
SELECT * FROM pedidos;

-- Inserindo o pedido no pedido item (CARRINHO)
INSERT INTO pedido_item (cod_pedido, cod_produto, quantidade, valor_unitario, status, valor_total) VALUES
(1,6,'6',199.99,'ENVIADO', 6 * 199.99),
(1,23,'2',59.90,'ENVIADO', 2 * 59.90),
(2,7,'2', 90.00,'ENVIADO', 2 * 90.00),
(3,20,'1', 259.99,'ENVIADO', 259.00);

-- Verificar o pedido_item (carrinho)
SELECT * FROM pedido;


--c. 1 SQL para construção de nota fiscal
SELECT 
    clientes.nome,
	clientes.cpf,
	clientes.telefone,
	enderecos.cidade,
    pedido_item.cod_produto,
    pedido_item.cod_pedido,
    pedido_item.quantidade,
    pedido_item.valor_unitario,
    (pedido_item.quantidade * pedido_item.valor_unitario) AS valor_total,
	SUM (pedido_item.quantidade * pedido_item.valor_unitario) OVER (PARTITION BY pedido_item.cod_pedido) AS total_geral
FROM 
    pedido_item
JOIN 
    pedidos ON pedido_item.cod_pedido = pedidos.cod_pedido
JOIN 
    clientes ON pedidos.cod_cliente = clientes.cod_cliente
JOIN 
    enderecos ON clientes.cod_endereco = enderecos.cod_endereco
WHERE 
    pedido_item.cod_pedido = 1
	GROUP BY (
    clientes.nome,
	clientes.cpf,
	clientes.telefone,
	enderecos.cidade,
	pedido_item.cod_produto,
    pedido_item.cod_pedido,
    pedido_item.quantidade,
    pedido_item.valor_unitario,
	valor_total
	);
