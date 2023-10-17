-- Selects simples:
use arcoffee;

select * from Empresa;

select * from Usuario;

select * from estoque;

select * from tipoCafe;

select * from leitura;

select * from sensor;

-- Joins 

select empresa.nome as Empresa, usuario.login as Login from empresa join usuario on fk_Empresa = idEmpresa;

select empresa.nome as Empresa, estoque.localizacaoEstq as Local_Estoque, tipocafe.nome as Tipo_Cafe from Empresa join estoque 
on fk_Empresa = idEmpresa join tipocafe on idcafe = fk_cafe where idEmpresa = 1;

select estoque.localizacaoEstq as Localização_Estoque, sensor.fk_estoque as Sensor, leitura.temperatura as Temperatura, leitura.umidade as Umidade
from Estoque join sensor on estoque.fk_Empresa = sensor.fk_Empresa and idEstoque = fk_Estoque join leitura on idSensor = fk_Sensor
where idEstoque = 1 and estoque.fk_empresa = 1;