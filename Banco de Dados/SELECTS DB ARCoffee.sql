-- Selects simples:
select * from cliente;

select * from estoque;

select * from tipoCafe;

select * from leitura;

select * from usuario;

select * from sensor;

-- Select tabela Temperatura
select temperatura as "Temperatura", dataHora as "Data e Hora" from leitura where idCliente = 3;

-- Select tabela Umidade
select umidade as "Umidade", dataHora as "Data e Hora" from leitura where idCliente = 3;

-- Select sinal amarelo quente/humido
select idCliente as "ID do cliente", temperatura as "Temperatura", umidade as "Umidade", dataHora as "Data e Hora" from leitura where temperatura > 26 or umidade > 13;

-- Select sinal vermelho quente/humido
select idCliente as "ID do cliente", temperatura as "Temperatura", umidade as "Umidade", dataHora as "Data e Hora" from leitura where temperatura > 30 or umidade > 20;

-- Select sinal amarelo frio/seco
select idCliente as "ID do cliente", temperatura as "Temperatura", umidade as "Umidade", dataHora as "Data e Hora" from leitura where temperatura < 12 or umidade < 9;

-- Select sinal vermelho frio/seco
select idCliente as "ID do cliente", temperatura as "Temperatura", umidade as "Umidade", dataHora as "Data e Hora" from leitura where temperatura < 9 or umidade < 5;


