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
    Plano varchar(15)
);

-- Criando tabela tipoCafe
create table tipoCafe (
    idCafe int primary key auto_increment,
    nome varchar (50),
    minimoTemperatura int,
    maximoTemperatura int,
    minimoUmidade int,
    maximoUmidade int
);


-- Criando tabela estoque
create table estoque(
    idEstoque int,
	fk_Cliente int,
    localizacaoEstq varchar(100),
	volumeEstoque int, 
    fk_Cafe int,
    primary key (idEstoque, fk_Cliente),
    constraint Estoque_fk_Cafe foreign key (fk_Cafe) references tipoCafe(idCafe),
    constraint Estoque_fk_Cliente foreign key (fk_Cliente) references Cliente(idCliente)
);


-- Criando tabela sensor
create table sensor(
    idSensor int primary key auto_increment,
    PortaArduino char(2),
    fk_Cliente int,
    fk_Estoque int,
    constraint sensor_fk_Cliente foreign key (fk_Cliente) references estoque(fk_Cliente), 
    constraint sensor_fk_Estoque foreign key (fk_Estoque) references estoque(idEstoque)
);

-- Criando tabela leitura
create table leitura (
    idLeitura int,
    fk_Sensor int,
    temperatura int,
    umidade int,
    dataHora datetime,
    primary key (idLeitura, fk_Sensor),
    constraint leitura_fk_Sensor foreign key (fk_Sensor) references Sensor(idSensor)
);

-- Criando tabela usuario
create table usuario(
    idUsuario int,
	fk_Cliente int,
    login varchar(50),
    senha varchar (50),
    primary key (idUsuario, fk_Cliente),
    constraint usuario_fk_Cliente foreign key (fk_Cliente) references Cliente(idCliente)
);



