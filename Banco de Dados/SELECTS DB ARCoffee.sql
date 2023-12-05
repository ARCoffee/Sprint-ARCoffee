-- Selects simples:
use arcoffee;

select * from Empresa;

select * from funcionario;

select * from Armazem;

select * from tipoCafe;

select * from historicoSensor;

-- select * from sensor;

-- Joins 

select empresa.nome as Empresa, funcionario.nome as Login from empresa join funcionario on fk_Empresa = idEmpresa;

select empresa.nome as Empresa, Armazem.localizacaoArmazem as Local_Armazem, tipocafe.nome as Tipo_Cafe from Empresa join Armazem 
on fk_Empresa = idEmpresa join tipocafe on idcafe = fk_cafe where idEmpresa = 1;

select Armazem.localizacaoArmazem as Localização_Armazem, historicoSensor.fk_Armazem as Sensor, historicoSensor.temperatura as Temperatura, historicoSensor.umidade as Umidade
from Armazem join historicoSensor ON Armazem.fk_Empresa = historicoSensor.fk_Empresa
AND Armazem.idArmazem = historicoSensor.fk_Armazem
WHERE Armazem.idArmazem = 1 AND Armazem.fk_empresa = 1;


