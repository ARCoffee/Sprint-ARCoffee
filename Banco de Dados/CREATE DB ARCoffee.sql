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
    Plano varchar(15),
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

-- Criando tabela usuario
create table usuario(
    idUsuario int primary key auto_increment,
    login varchar(50),
    senha varchar (50),
    idCliente int
);

-- Criando tabela sensor
create table sensor(
    idSensor int primary key auto_increment,
    idCliente int,
    idEstq int
);


