-- Criando banco de dados ARcoffee
create database ARcoffee;

-- Usando banco de dados ARcoffee
use ARcoffee;

-- Criando tabela cliente
create table cliente (
    idCliente int primary key auto_increment,
    nome varchar (50),
    cpf_cnpjCliente varchar(14) not null,
    contato varchar(11),
    areaContratada float,
    idPlano int,
    fk_codCafe int
);

-- Criando tabela estoque
create table estoque(
    idEstq int primary key auto_increment,
    localizacaoEstq varchar(100),
	volumeEstoque int, -- quantidade de sacas
    codEstq int,
    idCliente int
);

-- Criando tabela tipoCafe
create table tipoCafe (
    codCafe int primary key auto_increment,
    nome varchar (50),
    tratamento varchar (50) 
);

-- Criando tabela leitura
create table leitura (
    idLeitura int primary key auto_increment,
    temperatura int,
    umidade int,
    dataHora datetime,
    idSensor int,
    idCliente int
);

-- Criando tabela tipoEstoque
-- create table tipoEstoque (
--    codEstq int primary key auto_increment,
--    tipoEstq varchar (50),
--    volumeEstq float
-- );

-- PERGUNTAR SOBRE 	
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

-- Criado tabela pesquisa
create table pesquisa(
    idPesquisa int primary key auto_increment,
    nome varchar(50),
    telefone varchar(20),
    email varchar(40),
    estado varchar(10),
    duvidas varchar(1000)
);

-- Criando tabela sensor
create table sensor(
    idSensor int primary key auto_increment,
    localSensor varchar (50),
    idCliente int,
    idEstq int
);


