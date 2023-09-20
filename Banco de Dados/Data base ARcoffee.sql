create database ARcoffee;

-- Criando banco de dados ARcoffee
use ARcoffee;

-- Usando banco de dados ARcoffee
create table cliente (
    idCliente int primary key auto_increment,
    nome varchar (50),
    cpf_cnpjCliente varchar(14) not null,
    contato varchar(50),
    areaContratada float,
    idPlano int
);

-- Criando tabela cliente
insert into
    cliente
values
    (
        null,
        'Renato Santos Drummond',
        '78906784226',
        '11987017701',
        '10',
        '1'
    ),
    (
        null,
        'Gilberto Pascoal',
        '19890476112',
        '12977450864',
        '210',
        '1'
    ),
    (
        null,
        'Sandra Ximenes Brasil',
        '88541827431',
        '62978109733',
        '200',
        '3'
    ),
    (
        null,
        'Coperativa Jean e Filho',
        '1290385478573',
        '11963980337',
        '420',
        '3'
    ),
    (
        null,
        'Grupo Jennifer Silva',
        '7596788456138',
        '71923679948',
        '840',
        '2'
    ),
    (
        null,
        'Ivanice Ferreira',
        '99879473773',
        '73987609943',
        '220',
        '2'
    ),
    (
        null,
        'Juvenal Costa Brito',
        '87290313773',
        '31946788431',
        '40',
        '1'
    );

-- Inserindo valores na tabela cliente
select
    *
from
    cliente;

create table estoque(
    idEstq int primary key auto_increment,
    localizacaoEstq varchar(100),
    codEstq int,
    idCliente int
);

-- Criando tabela estoque
insert into
    estoque
values
    (null, 'al santos, 327', '2', '1'),
    (null, 'al santos, 330', '2', '1'),
    (null, 'al santos, 334', '2', '1'),
    (null, 'al Presidente Vargas, 123', '3', '2'),
    (null, 'Av Paulista 327', '1', '3'),
    (null, 'al santos, 421', '2', '4'),
    (null, 'al Ferraz, 332', '2', '5'),
    (null, 'al Silva, 673', '2', '6'),
    (null, 'al Airton Senna, 823', '2', '6'),
    (null, 'al Saraiva, 239', '2', '6'),
    (null, 'al Trans Americana, 1234', '1', '7');

select
    *
from
    estoque;

-- Inserindo valores na tabela estoque
create table tipoCafe (
    codCafe int primary key auto_increment,
    nome varchar (50),
    tratamento varchar (50)
);

-- Criando tabela tipoCafe
insert into
    tipoCafe
values
    (null, 'Arabica', 'entre 11 e 13%'),
    (null, 'Robusta', 'entre 10 e 12%'),
    (null, 'Bourbon', 'entre 9 e 12%'),
    (null, 'Conilon', 'entre 11 e 14%');

-- Inserindo valores em tipoCafe
select
    *
from
    tipoCafe;

create table leitura (
    idLeitura int primary key auto_increment,
    temperatura int,
    umidade varchar(50),
    dataHora datetime,
    idSensor int,
    idCliente int
);

-- Criando tabela leitura
insert into
    leitura
values
    (null, '21', '60%', "2023-09-11 10:31:15", '1', '1'),
    (null, '19', '76%', "2023-09-11 10:32:15", '1', '1'),
    (null, '17', '70%', "2023-09-11 10:33:15", '1', '2'),
    (null, '11', '77%', "2023-09-11 10:34:15", '2', '2'),
    (null, '25', '45%', "2023-09-11 10:35:15", '3', '3'),
    (null, '26', '20%', "2023-09-11 10:36:15", '3', '3'),
    (null, '16', '72%', "2023-09-11 10:37:15", '4', '3'),
    (null, '21', '67%', "2023-09-11 10:38:15", '4', '3'),
    (null, '24', '51%', "2023-09-11 10:39:15", '5', '4'),
    (null, '22', '64%', "2023-09-11 10:40:15", '5', '4'),
    (null, '32', '27%', "2023-09-11 10:45:15", '6', '5'),
    (null, '5', '80%', "2023-09-11 10:33:15", '7', '7'),
    (null, '7', '75%', "2023-09-11 10:42:15", '7', '7'),
    (null, '6', '79%', "2023-09-11 10:43:15", '7', '7'),
    (null, '12', '67%', "2023-09-11 10:47:15", '7', '7'),
    (null, '18', '62%', "2023-09-11 11:51:15", '7', '7');

-- Inserindo valores na tabela leitura
select
    *
from
    leitura;

create table tipoEstoque (
    codEstq int primary key auto_increment,
    tipoEstq varchar (50),
    volumeEstq float
);

-- Criando tabela tipoEstoque
insert into
    tipoEstoque
values
    (null, 'Tulha', '125'),
    (null, 'Armazem', '2900'),
    (null, 'Silo', '198');

-- nserindo valores a tipoEstoque
select
    *
from
    tipoEstoque;

create table calculadora(
    idRegistro int primary key auto_increment,
    tamanhoArmazen float,
    qntdArmazen float,
    prodMensal float,
    qntdPerda float
);

-- Criando tabela calculadora
insert into
    calculadora
values
    (null, '10', '1', '50', '7'),
    (null, '210', '1', '540', '13'),
    (null, '420', '2', '1210', '87'),
    (null, '575', '2', '1620', '29'),
    (null, '840', '3', '2978', '76'),
    (null, '250', '1', '748', '18'),
    (null, '65', '1', '36', '7');

-- Inserindo valores na tabela calculadora
select
    *
from
    calculadora;

create table plano(
    idPlano int primary key auto_increment,
    nome varchar(50),
    descricao varchar(1000)
);

-- Criando tabela plano
insert into
    plano
values
    (
        null,
        'Basic',
        'Uma consulta com técnico para explicação de funcionalidades web e
 acesso a 5 usuários, acesso a informação armazenada por um semestre'
    ),
    (
        null,
        'Pro',
        'Acesso a 10 usuários, duas consultas com técnico para explicação de funcionalidades web e
 acesso a informação armazenada por um ano'
    ),
    (
        null,
        'Pro Plus',
        'Todas as vantagens de ser pro, consultas semestrais gratuitas sobre selo green e
 acesso a informação armazenada por dois anos'
    );

-- Inserindo valores na tabela plano
select
    *
from
    plano;

create table usuario(
    idUsuario int primary key auto_increment,
    login varchar(50),
    senha varchar (50),
    idCliente int
);

-- Criando tabela usuario
insert into
    usuario
values
    (null, 'RenatoSantos32', 'Maria29072001', '1'),
    (null, 'MariaSantos11', 'Renato24071984', '1'),
    (null, 'Jonas192', '2991MR', '1'),
    (null, 'ReiGilberto', 'MelhorAgricultor221', '2'),
    (null, 'Felipe12', 'Sorvetedecreme10', '2'),
    (null, 'Alex91', '81293Rt1&881', '2'),
    (null, 'JuliaSena', 'minhasenha991', '2'),
    (
        null,
        'Sandra_XimenesConta001',
        '1*_T2&m#SnX{%112',
        '3'
    ),
    (null, 'Sandra_XimenesConta002', '9912#SnX', '3'),
    (
        null,
        'Sandra_XimenesConta003',
        '0129381#SnX91',
        '3'
    ),
    (null, 'Sandra_XimenesConta004', '8173#SnX8181', '3'),
    (null, 'Sandra_XimenesConta005', '#Snx9818102', '3'),
    (null, 'Sandra_XimenesConta006', 'eI71%a#SnX', '3'),
    (null, 'Sandra_XimenesConta007', '019298#SnX', '3'),
    (
        null,
        'Sandra_XimenesConta008',
        '91wiA0a2#G23SnX',
        '3'
    ),
    (
        null,
        'Sandra_XimenesConta009',
        '919OpqX862%#SnX',
        '3'
    ),
    (
        null,
        'Sandra_XimenesConta010',
        '1#SnX09182U&1pK',
        '3'
    ),
    (null, 'CoperativaJ&F', 'café123', '4'),
    (null, 'JeanJr12', 'Lisa1992', '4'),
    (null, 'GrupoJenniferS', '71&&%`21pCaf3', '5'),
    (null, 'GrupoJenniferS0', '082K81uy!2Caf3', '5'),
    (null, 'GrupoJenniferS1', '019*$51Caf3', '5'),
    (null, 'GrupoJenniferS2', 'oap*918IoqCaf3', '5'),
    (null, 'GrupoJenniferS3', '01827Jgst%1Caf3', '5'),
    (null, 'Ivanice244', '20060821', '6'),
    (null, 'Laura91', '20060121', '6'),
    (null, 'Juvenal', 'senha', '7');

-- Inserindo valores na tabela usuario
select
    *
from
    usuario;

create table pesquisa(
    idPesquisa int primary key auto_increment,
    nome varchar(50),
    telefone varchar(20),
    email varchar(40),
    estado varchar(10),
    duvidas varchar(1000)
);

-- Criado tabela pesquisa
insert into
    pesquisa
values
    (
        null,
        'João Carlos Medeiros',
        '31 945997610',
        'CarlosCoopMG@hotmail.com',
        'MG',
        'Quantos metros quadrados são o minimo necessario para contratar o serviço? 
Tenho um pequeno armazem de tulha mas pretendo expandir no futuro proximo,
 qual é o suporte da empresa em relação a isso?'
    ),
    (
        null,
        'Patricia Mota',
        null,
        'PatriciaMota81@gmail.com',
        'BA',
        'Qual é o suporte oferecido em relação a implementação de
automação no processo de secagem?'
    ),
    (
        null,
        'Maria Eduarda Santos',
        '67 918297741',
        'CooperativaScarpa@agro.com',
        'MS',
        'Quantos clientes utilizam o plano pro plus? e além do que é apresentado no site o que é oferecido?'
    ),
    (
        null,
        'Jonas Rodrigues',
        '71 910896623',
        'JohnSnowRd1@outlook.com',
        'BA',
        'Em relação a quantidade de sensores no armazem
é possivel utilizar os sensores em bloco para monitorar a media de temperatura em uma area maior e utilizar as
metricas dos mesmos para diminuir a quantidade de sensores instalados?'
    ),
    (
        null,
        'Ivan Silva Borges',
        null,
        'GrupoServit@yahoo.com',
        'SP',
        'Já adquiri uma solução de tecnologia na minha produção mas tenho problemas com utilizar computadores,
no plano pro plus a consulta semestral me ajuda a organizar os dados e desenvolver uma solução?'
    );

-- Inserindo valores na tabela pesquisa
select
    *
from
    pesquisa;

create table sensor(
    idSensor int primary key auto_increment,
    localSensor varchar (50),
    idCliente int,
    idEstq int
);

-- Criando tabela sensor
insert into
    sensor
values
    (null, 'Unico sensor na tulha', '1', '1'),
    (null, 'Primeiro sensor da ala esquerda', '2', '2'),
    (null, 'Segundo sensor da ala esquerda', '2', '2'),
    (null, 'Terceiro sensor da ala esquerda', '2', '2'),
    (null, 'Quarto sensor da ala esquerda', '2', '2'),
    (null, 'Quinto sensor da ala esquerda', '2', '2'),
    (null, 'Sexto sensor da ala esquerda', '2', '2'),
    (null, 'Setimo sensor da ala esquerda', '2', '2'),
    (null, 'Primeiro sensor do centro', '2', '2'),
    (null, 'Segundo sensor do centro', '2', '2'),
    (null, 'Terceiro sensor do centro', '2', '2'),
    (null, 'Quarto sensor do centro', '2', '2'),
    (null, 'Quinto sensor do centro', '2', '2'),
    (null, 'Primeiro sensor da ala direita', '2', '2'),
    (null, 'Segundo sensor da ala direita', '2', '2'),
    (null, 'Terceiro sensor da ala direita', '2', '2'),
    (null, 'Quarto sensor da ala direita', '2', '2'),
    (null, 'Quinto sensor da ala direita', '2', '2'),
    (null, 'Sexto sensor da ala direita', '2', '2'),
    (null, 'Setimo sensor da ala direita', '2', '2'),
    (null, 'Primeiro sensor da ala esquerda', '3', '3'),
    (null, 'Segundo sensor da ala esquerda', '3', '3'),
    (null, 'Terceiro sensor da ala esquerda', '3', '3'),
    (null, 'Quarto sensor da ala esquerda', '3', '3'),
    (null, 'Quinto sensor da ala esquerda', '3', '3'),
    (null, 'Sexto sensor da ala esquerda', '3', '3'),
    (null, 'Setimo sensor da ala esquerda', '3', '3'),
    (null, 'Oitavo sensor da ala esquerda', '3', '3'),
    (null, 'Nono sensor da ala esquerda', '3', '3'),
    (null, 'Decimo sensor da ala esquerda', '3', '3'),
    (null, 'Primeiro sensor da ala direita', '3', '3'),
    (null, 'Segundo sensor da ala direita', '3', '3'),
    (null, 'Terceiro sensor da ala direita', '3', '3'),
    (null, 'Quarto sensor da ala direita', '3', '3'),
    (null, 'Quinto sensor da ala direita', '3', '3'),
    (null, 'Sexto sensor da ala direita', '3', '3'),
    (null, 'Setimo sensor da ala direita', '3', '3'),
    (null, 'Oitavo sensor da ala direita', '3', '3'),
    (null, 'Nono sensor da ala direita', '3', '3'),
    (null, 'Decimo sensor da ala direita', '3', '3');

-- Inserindo valores na tabela sensor
select
    *
from
    sensor;

-- Selects:
-- Select tabela Temperatura
select
    temperatura as "Temperatura",
    dataHora as "Data e Hora"
from
    leitura
where
    idCliente = 3;

-- Select tabela Umidade
select
    umidade as "Umidade",
    dataHora as "Data e Hora"
from
    leitura
where
    idCliente = 3;

-- Select sinal amarelo quente/humido
select
    idCliente as "ID do cliente",
    temperatura as "Temperatura",
    umidade as "Umidade",
    dataHora as "Data e Hora"
from
    leitura
where
    temperatura > 26
    or umidade > 13;

-- Select sinal vermelho quente/humido
select
    idCliente as "ID do cliente",
    temperatura as "Temperatura",
    umidade as "Umidade",
    dataHora as "Data e Hora"
from
    leitura
where
    temperatura > 30
    or umidade > 20;

-- Select sinal amarelo frio/seco
select
    idCliente as "ID do cliente",
    temperatura as "Temperatura",
    umidade as "Umidade",
    dataHora as "Data e Hora"
from
    leitura
where
    temperatura < 12
    or umidade < 9;

-- Select sinal vermelho frio/seco
select
    idCliente as "ID do cliente",
    temperatura as "Temperatura",
    umidade as "Umidade",
    dataHora as "Data e Hora"
from
    leitura
where
    temperatura < 9
    or umidade < 5;