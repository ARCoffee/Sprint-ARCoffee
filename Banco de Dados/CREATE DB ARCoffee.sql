
-- Criando banco de dados ARcoffee
create database ARcoffee;

-- Usando banco de dados ARcoffee
use ARcoffee;

-- Criando tabela cliente
create table Empresa (
    idEmpresa int primary key auto_increment,
    nome varchar (50),
    cpf_cnpjEmpresa varchar(14) not null,
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

-- Criando tabela Armazem
create table Armazem(
    idArmazem int,
	fk_Empresa int,
    localizacaoEstq varchar(100),
	volumeArmazem int, 
    fk_Cafe int,
    primary key (idArmazem, fk_Empresa),
    constraint Armazem_fk_Cafe foreign key (fk_Cafe) references tipoCafe(idCafe),
    constraint Armazem_fk_Empresa foreign key (fk_Empresa) references Empresa(idEmpresa)
);


-- Criando tabela sensor
create table sensor(
    idSensor int primary key auto_increment,
    PortaArduino char(2),
    fk_Empresa int,
    fk_Armazem int,
    constraint sensor_fk_Empresa foreign key (fk_Empresa) references Armazem(fk_Empresa), 
    constraint sensor_fk_Armazem foreign key (fk_Armazem) references Armazem(idArmazem)
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
	fk_Empresa int,
    nome varchar(50),
    email varchar(255),
    senha varchar (50),
    primary key (idUsuario, fk_Empresa),
    constraint usuario_fk_Empresa foreign key (fk_Empresa) references Empresa(idEmpresa)
);

-- criando a tabela alerta sensor 
create table historicoAlerta (
	idhistoricoAlerta int,
	temperatura1 int,
	temperatura2 int,
	temperatura3 int,
	temperatura4 int,
	temperatura5 int,
	umidade1 int,
	umidade2 int,
	umidade3 int,
	umidade4 int,
	umidade5 int,
	dataHora datetime
);



