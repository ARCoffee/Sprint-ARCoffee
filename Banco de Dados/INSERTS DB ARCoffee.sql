-- Inserindo valores na tabela Empresa
insert into Empresa (nome, cnpj, contato, Plano) values
    ('Fazenda Sol', '78906784226','11987017701', "Basic"),
    ('Pilão', '19890476112', '12977450864', "Basic"),
    ('Starbucks', '88541827431','62978109733', "Pro Plus"),
    ('Vale do Ouro Verde', '1290385478573', '11963980337',  "Pro Plus"),
    ('Fazenda Campo Místico', '7596788456138', '71923679948', "Pro"); 
    
-- Inserindo valores em tipoCafe
insert into tipoCafe (nome, minimoTemperatura, maximoTemperatura, minimoUmidade, maximoUmidade)values
    ('Arabica', 16, 24, 10, 12),
    ('Conilon', 15, 20, 11, 13),
    ('Bourbon', 14, 20, 12, 14),
    ('Catuaí', 16, 20, 11, 19);
    
-- Inserindo valores na tabela Armazem
insert into Armazem (idArmazem, fk_Empresa, localizacaoArmazem, volumeArmazem, fk_Cafe) values
	(1,1,'al santos, 327', 200,  1),
    (2,1,'al santos, 330', 212,  2),
    (3,1,'al santos, 334', 190,  3),
    (1,2,'al Presidente Vargas, 123', 70, 2),
    (2,2,'Av Paulista 327', 100, 3),
    (3,2,'al santos, 421', 100, 4),
    (1,3,'al Ferraz, 332', 50, 4),
    (1,4,'al Silva, 673', 100, 2),
    (2,4,'al Airton Senna, 823', 200, 1),
    (1,5,'al Saraiva, 239', 50, 3),
    (2,5,'al Trans Americana, 1234', 150, 4);
    
-- Inserindo valores na tabela sensor
insert into sensor (PortaArduino, fk_Empresa, fk_Armazem) values
    (3,1,1),
    (2,3,1),
    (1,4,1),
    (7,2,1),
    (6,5,1),
    (4,1,2),
    (3,2,2),
    (8,4,2),
    (7,5,2),
    (4,2,3),
    (5,1,3);

-- Inserção de valores na tabela leitura
insert into HistoricoSensor (temperatura, umidade, dataHora) values
    (21, 60, "2023-09-11 10:31:15"),
    (19, 76, "2023-09-11 10:32:15"),
    (17, 70, "2023-09-11 10:33:15"),
    (11, 77, "2023-09-11 10:34:15"),
    (25, 45, "2023-09-11 10:35:15"),
    (26, 20, "2023-09-11 10:36:15"),
    (16, 72, "2023-09-11 10:37:15"),
    (21, 67, "2023-09-11 10:38:15"),
    (24, 51, "2023-09-11 10:39:15"),
    (22, 64, "2023-09-11 10:40:15"),
    (32, 27, "2023-09-11 10:45:15"),
    (5, 80, "2023-09-11 10:33:15"),
    (7, 75, "2023-09-11 10:42:15"),
    (6, 79, "2023-09-11 10:43:15"),
    (12, 67, "2023-09-11 10:47:15"),
    (18, 62, "2023-09-11 11:51:15"),
    (21, 67, "2023-09-11 10:38:15");
    

-- Inserindo valores na tabela usuario
insert into funcionario (idFuncionario, fk_Empresa, nome, senha) values
    (1,1,'RenatoSantos32', 'Maria29072001'),
    (2,1,'MariaSantos11', 'Renato24071984'),
    (1,2,'Jonas192', '2991Jonas'),
    (1,3,'ReiGilberto', 'MelhorAgricultor221'),
    (2,3,'Felipe12', 'Sorvetedecreme10'),
    (1,4,'Alex91', '81293Rt1&881'),
    (1,5,'JuliaSena', 'minhasenha991');
    
