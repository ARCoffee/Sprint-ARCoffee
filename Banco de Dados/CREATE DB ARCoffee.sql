
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
    localizacaoArmazem varchar(100),
	volumeArmazem int, 
    fk_Cafe int,
    primary key (idArmazem, fk_Empresa),
    constraint Armazem_fk_Cafe foreign key (fk_Cafe) references tipoCafe(idCafe),
    constraint Armazem_fk_Empresa foreign key (fk_Empresa) references Empresa(idEmpresa)
);


-- Criando tabela sensor
create table HistoricoLeitura(
    idHistoricoSensor int primary key auto_increment,
    temperatura float,
	umidade float,
    fk_Empresa int,
    fk_Armazem int,
    dataHora datetime,
    constraint HistoricoLeitura_fk_Empresa foreign key (fk_Empresa) references Armazem(fk_Empresa), 
    constraint HistoricoLeitura_fk_Armazem foreign key (fk_Armazem) references Armazem(idArmazem)
);

-- Criando tabela usuario
create table usuario(
    idUsuario int auto_increment,
	fk_Empresa int,
    nome varchar(50),
    email varchar(255),
    senha varchar (50),
    primary key (idUsuario, fk_Empresa),
    constraint usuario_fk_Empresa foreign key (fk_Empresa) references Empresa(idEmpresa)
);



