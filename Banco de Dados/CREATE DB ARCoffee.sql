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
    fk_idCafe int,
    constraint fk_idCafe foreign key (fk_idCafe) references tipoCafe(idCafe)
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
    idEstq int primary key auto_increment,
    localizacaoEstq varchar(100),
	volumeEstoque int, -- quantidade de sacas
    fk_Cliente int,
    constraint fk_Cliente foreign key (fk_Cliente) references Cliente(idCliente)
);


-- Criando tabela sensor
create table sensor(
    idSensor int primary key auto_increment,
    PortaArduino char(2),
    fk_Cliente int,
    fk_Estq int,
    constraint fk_Estoque foreign key (fk_Estq) references estoque(idEstq)
    --     constraint fk_Cliente foreign key (fk_Cliente) references Cliente(idCliente),

);

-- Criando tabela leitura
create table leitura (
    idLeitura int primary key auto_increment,
    temperatura int,
    umidade int,
    dataHora datetime,
    fk_Sensor int,
    constraint fk_Sensor foreign key (fk_Sensor) references Sensor(idSensor)
    
);

-- Criando tabela usuario
create table usuario(
    idUsuario int primary key auto_increment,
    login varchar(50),
    senha varchar (50),
    fk_Cliente int
    --     constraint fk_Cliente foreign key (fk_Cliente) references Cliente(idCliente),
);



