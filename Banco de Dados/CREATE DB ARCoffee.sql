-- Criando banco de dados ARcoffee
create database ARcoffee;

-- Usando banco de dados ARcoffee
use ARcoffee;

-- Criando tabela cliente
create table cliente (
    idCliente int primary key auto_increment,
    nome varchar (50),
    cpf_cnpjCliente varchar(14) not null,
    contato varchar(50),
    areaContratada float,
    idPlano int
);

-- Inserindo valores na tabela cliente
insert into cliente (nome, cpf_cnpjCliente, contato, areaContratada, idPlano) values
    ('Renato Santos Drummond', '78906784226','11987017701', 10, 1),
    
    ('Gilberto Pascoal', '19890476112', '12977450864', 210, 1),
    
    ('Sandra Ximenes Brasil', '88541827431','62978109733',200, 3),
   
    ( 'Coperativa Jean e Filho', '1290385478573', '11963980337', 420, 3),
    
    ('Grupo Jennifer Silva', '7596788456138', '71923679948', 840, 2),
    
    ('Ivanice Ferreira', '99879473773', '73987609943', 220, 2),
    
    ('Juvenal Costa Brito', '87290313773', '31946788431', 40, 1);

-- Criando tabela estoque
create table estoque(
    idEstq int primary key auto_increment,
    localizacaoEstq varchar(100),
    codEstq int,
    idCliente int
);

-- Inserindo valores na tabela estoque
insert into estoque (localizacaoEstq,codEstq,idCliente)values
	('al santos, 327', 2, '1'),
    ('al santos, 330', 2, '1'),
    ('al santos, 334', 2, '1'),
    ('al Presidente Vargas, 123', 3, 2),
    ('Av Paulista 327', 1, 3),
    ('al santos, 421', 2, 4),
    ('al Ferraz, 332', 2, 5),
    ('al Silva, 673', 2, 6),
    ('al Airton Senna, 823', 2, 6),
    ('al Saraiva, 239', 2, 6),
    ('al Trans Americana, 1234', 1, 7);


-- Criando tabela tipoCafe
create table tipoCafe (
    codCafe int primary key auto_increment,
    nome varchar (50),
    tratamento varchar (50)
);

-- Inserindo valores em tipoCafe
insert into tipoCafe (nome,tratamento)values
    ('Arabica', 'entre 11 e 13%'),
    ('Robusta', 'entre 10 e 12%'),
    ('Bourbon', 'entre 9 e 12%'),
    ('Conilon', 'entre 11 e 14%');


-- Criando tabela leitura
create table leitura (
    idLeitura int primary key auto_increment,
    temperatura int,
    umidade varchar(50),
    dataHora datetime,
    idSensor int,
    idCliente int
);

-- Inserção de valores na tabela leitura
insert into leitura (temperatura, umidade, dataHora, idSensor, idCliente) values
    (21, '60%', "2023-09-11 10:31:15", 1, 1),
    (19, '76%', "2023-09-11 10:32:15", 1, 1),
    (17, '70%', "2023-09-11 10:33:15", 1, 2),
    (11, '77%', "2023-09-11 10:34:15", 2, 2),
    (25, '45%', "2023-09-11 10:35:15", 3, 3),
    (26, '20%', "2023-09-11 10:36:15", 3, 3),
    (16, '72%', "2023-09-11 10:37:15", 4, 3),
    (21, '67%', "2023-09-11 10:38:15", 4, 3),
    (24, '51%', "2023-09-11 10:39:15", 5, 4),
    (22, '64%', "2023-09-11 10:40:15", 5, 4),
    (32, '27%', "2023-09-11 10:45:15", 6, 5),
    (5, '80%', "2023-09-11 10:33:15", 7, 7),
    (7, '75%', "2023-09-11 10:42:15", 7, 7),
    (6, '79%', "2023-09-11 10:43:15", 7, 7),
    (12, '67%', "2023-09-11 10:47:15", 7, 7),
    (18, '62%', "2023-09-11 11:51:15", 7, 7);


-- Criando tabela tipoEstoque
create table tipoEstoque (
    codEstq int primary key auto_increment,
    tipoEstq varchar (50),
    volumeEstq float
);

-- Inserindo valores a tipoEstoque
insert into tipoEstoque (tipoEstq,volumeEstq) values
    ('Tulha', '125'),
    ('Armazem', '2900'),
    ('Silo', '198');



-- Criando tabela plano
create table plano(
    idPlano int primary key auto_increment,
    nome varchar(50)
);

-- Inserindo valores na tabela plano
insert into plano values
    (null, 'Basic'),
    (null, 'Pro'),
    (null, 'Pro Plus');


-- Criando tabela usuario
create table usuario(
    idUsuario int primary key auto_increment,
    login varchar(50),
    senha varchar (50),
    idCliente int
);

-- Inserindo valores na tabela usuario
insert into usuario (login,senha,idCliente) values
    ('RenatoSantos32', 'Maria29072001', 1),
    ('MariaSantos11', 'Renato24071984', 1),
    ('Jonas192', '2991MR', 1),
    ('ReiGilberto', 'MelhorAgricultor221', 2),
    ('Felipe12', 'Sorvetedecreme10', 2),
    ('Alex91', '81293Rt1&881', 2),
    ('JuliaSena', 'minhasenha991', 2),
    ('Sandra_XimenesConta001', '1*_T2&m#SnX{%112', 3),
    ('Sandra_XimenesConta002', '9912#SnX', 3),
    ('Sandra_XimenesConta003', '0129381#SnX91',3),
    ('Sandra_XimenesConta004', '8173#SnX8181', 3),
    ('Sandra_XimenesConta005', '#Snx9818102', 3),
    ('Sandra_XimenesConta006', 'eI71%a#SnX', 3),
    ('Sandra_XimenesConta007', '019298#SnX', 3),
    ('Sandra_XimenesConta008', '91wiA0a2#G23SnX', 3),
    ('Sandra_XimenesConta009', '919OpqX862%#SnX', 3),
    ('Sandra_XimenesConta010', '1#SnX09182U&1pK', 3),
    ('CoperativaJ&F', 'café123', 4),
    ('JeanJr12', 'Lisa1992', 4),
    ('GrupoJenniferS', '71&&%`21pCaf3', 5),
    ('GrupoJenniferS0', '082K81uy!2Caf3', 5),
    ('GrupoJenniferS1', '019*$51Caf3', 5),
    ('GrupoJenniferS2', 'oap*918IoqCaf3', 5),
    ('GrupoJenniferS3', '01827Jgst%1Caf3', 5),
    ('Ivanice244', '20060821', 6),
    ('Laura91', '20060121', 6),
    ('Juvenal', 'senha', 7);
    

-- Criado tabela pesquisa
create table pesquisa(
    idPesquisa int primary key auto_increment,
    nome varchar(50),
    telefone varchar(20),
    email varchar(40),
    estado varchar(10),
    duvidas varchar(1000)
);

-- Inserindo valores na tabela pesquisa
insert into pesquisa (nome, telefone, email, estado, duvidas) values
    ('João Carlos Medeiros', '31945997610','CarlosCoopMG@hotmail.com', 'MG','Quantos metros quadrados são o minimo necessario para contratar o serviço? Tenho um pequeno armazem de tulha mas pretendo expandir no futuro proximo, qual é o suporte da empresa em relação a isso?'),
    ('Patricia Mota', null, 'PatriciaMota81@gmail.com', 'BA', 'Qual é o suporte oferecido em relação a implementação de automação no processo de secagem?'),
    ('Maria Eduarda Santos', '67918297741', 'CooperativaScarpa@agro.com', 'MS', 'Quantos clientes utilizam o plano pro plus? e além do que é apresentado no site o que é oferecido?'),
    ('Jonas Rodrigues', '71910896623', 'JohnSnowRd1@outlook.com', 'BA', 'Em relação a quantidade de sensores no armazem é possivel utilizar os sensores em bloco para monitorar a media de temperatura em uma area maior e utilizar as metricas dos mesmos para diminuir a quantidade de sensores instalados?'),
    ('Ivan Silva Borges', null, 'GrupoServit@yahoo.com', 'SP', 'Já adquiri uma solução de tecnologia na minha produção mas tenho problemas com utilizar computadores, no plano pro plus a consulta semestral me ajuda a organizar os dados e desenvolver uma solução?');


-- Criando tabela sensor
create table sensor(
    idSensor int primary key auto_increment,
    localSensor varchar (50),
    idCliente int,
    idEstq int
);

-- Inserindo valores na tabela sensor
insert into sensor (localSensor, idCliente, idEstq) values
    ( 'Unico sensor na tulha', 1, 1),
    ( 'Primeiro sensor da ala esquerda', 2, 2),
    ( 'Segundo sensor da ala esquerda', 2, 2),
    ( 'Terceiro sensor da ala esquerda', 2, 2),
    ( 'Quarto sensor da ala esquerda', 2, 2),
    ( 'Quinto sensor da ala esquerda', 2, 2),
    ( 'Sexto sensor da ala esquerda', 2, 2),
    ( 'Setimo sensor da ala esquerda', 2, 2),
    ( 'Primeiro sensor do centro', 2, 2),
    ( 'Segundo sensor do centro', 2, 2),
    ( 'Terceiro sensor do centro', 2, 2),
    ( 'Quarto sensor do centro', 2, 2),
    ( 'Quinto sensor do centro', 2, 2),
    ( 'Primeiro sensor da ala direita', 2, 2),
    ( 'Segundo sensor da ala direita', 2, 2),
    ( 'Terceiro sensor da ala direita', 2, 2),
    ( 'Quarto sensor da ala direita', 2, 2),
    ( 'Quinto sensor da ala direita', 2, 2),
    ( 'Sexto sensor da ala direita', 2, 2),
    ( 'Setimo sensor da ala direita', 2, 2),
    ( 'Primeiro sensor da ala esquerda', 3, 3),
    ( 'Segundo sensor da ala esquerda', 3, 3),
    ( 'Terceiro sensor da ala esquerda', 3, 3),
    ( 'Quarto sensor da ala esquerda', 3, 3),
    ( 'Quinto sensor da ala esquerda', 3, 3),
    ( 'Sexto sensor da ala esquerda', 3, 3),
    ( 'Setimo sensor da ala esquerda', 3, 3),
    ( 'Oitavo sensor da ala esquerda', 3, 3),
    ( 'Nono sensor da ala esquerda', 3, 3),
    ( 'Decimo sensor da ala esquerda', 3, 3),
    ( 'Primeiro sensor da ala direita', 3, 3),
    ( 'Segundo sensor da ala direita', 3, 3),
    ( 'Terceiro sensor da ala direita', 3, 3),
    ( 'Quarto sensor da ala direita', 3, 3),
    ( 'Quinto sensor da ala direita', 3, 3),
    ( 'Sexto sensor da ala direita', 3, 3),
    ( 'Setimo sensor da ala direita', 3, 3),
    ( 'Oitavo sensor da ala direita', 3, 3),
    ( 'Nono sensor da ala direita', 3, 3),
    ( 'Decimo sensor da ala direita', 3, 3);


