-- Selects simples:
use arcoffee;

select * from Empresa;

select * from Usuario;

select * from estoque;

select * from tipoCafe;

select * from historicoleitura;

select * from sensor;

-- Joins 

select empresa.nome as Empresa, usuario.login as Login from empresa join usuario on fk_Empresa = idEmpresa;

select empresa.nome as Empresa, Armazem.localizacaoEstq as Local_Armazem, tipocafe.nome as Tipo_Cafe from Empresa join Armazem 
on fk_Empresa = idEmpresa join tipocafe on idcafe = fk_cafe where idEmpresa = 1;

select Armazem.localizacaoEstq as Localização_Armazem, sensor.fk_Armazem as Sensor, leitura.temperatura as Temperatura, leitura.umidade as Umidade
from Armazem join sensor on Armazem.fk_Empresa = sensor.fk_Empresa and idArmazem = fk_Armazem join leitura on idSensor = fk_Sensor
where idArmazem = 1 and Armazem.fk_empresa = 1;


