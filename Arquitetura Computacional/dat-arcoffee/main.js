// não altere!
const serialport = require('serialport');
const express = require('express');
const mysql = require('mysql2');
const sql = require('mssql');

// não altere!
const SERIAL_BAUD_RATE = 9600;
const SERVIDOR_PORTA = 3300;

// configure a linha abaixo caso queira que os dados capturados sejam inseridos no banco de dados.
// false -> nao insere
// true -> insere
const HABILITAR_OPERACAO_INSERIR = true;

// altere o valor da variável AMBIENTE para o valor desejado:
// API conectada ao banco de dados remoto, SQL Server -> 'producao'
// API conectada ao banco de dados local, MySQL Workbench - 'desenvolvimento'
const AMBIENTE = 'desenvolvimento';

const serial = async (
    valoresDht11Umidade,
    valoresDht11Temperatura,
    valoresDht11S2Temp,
    valoresDht11S2Umi,
    valoresDht11S3Temp,
    valoresDht11S3Umi,
    valoresDht11S4Temp,
    valoresDht11S4Umi,
    valoresDht11S5Temp,
    valoresDht11S5Umi
) => {
    let poolBancoDados = ''

    if (AMBIENTE == 'desenvolvimento') {
        poolBancoDados = mysql.createPool(
            {
                // altere!
                // CREDENCIAIS DO BANCO - MYSQL WORKBENCH
                host: 'localhost',
                user: 'USUARIO_DO_BANCO_LOCAL',
                password: 'SENHA_DO_BANCO_LOCAL',
                database: 'DATABASE_LOCAL'
            }
        ).promise();
    } else if (AMBIENTE == 'producao') {
        console.log('Projeto rodando inserindo dados em nuvem. Configure as credenciais abaixo.');
    } else {
        throw new Error('Ambiente não configurado. Verifique o arquivo "main.js" e tente novamente.');
    }


    const portas = await serialport.SerialPort.list();
    const portaArduino = portas.find((porta) => porta.vendorId == 2341 && porta.productId == 43);
    if (!portaArduino) {
        throw new Error('O arduino não foi encontrado em nenhuma porta serial');
    }
    const arduino = new serialport.SerialPort(
        {
            path: portaArduino.path,
            baudRate: SERIAL_BAUD_RATE
        }
    );
    arduino.on('open', () => {
        console.log(`A leitura do arduino foi iniciada na porta ${portaArduino.path} utilizando Baud Rate de ${SERIAL_BAUD_RATE}`);
    });
    arduino.pipe(new serialport.ReadlineParser({ delimiter: '\r\n' })).on('data', async (data) => {
        //console.log(data);
        const valores = data.split(';');
        // valor = 30
        // sensor2 = valor * .30;
        const dht11Umidade = parseFloat(valores[0]);
        const dht11Temperatura = parseFloat(valores[1]);
        const sensor2temp = dht11Temperatura * 1.2;
        const sensor2umi = dht11Umidade * 1.3;
        const sensor3temp = dht11Temperatura * .30;
        const sensor3umi = dht11Umidade * .30;
        const sensor4umi = dht11Umidade * 1.4;
        const sensor4temp = dht11Temperatura * 1.4;
        const sensor5umi = dht11Umidade * 1.15;
        const sensor5temp = dht11Temperatura * 1.15;

        valoresDht11Umidade.push(dht11Umidade);
        valoresDht11Temperatura.push(dht11Temperatura);
        valoresDht11S2Temp.push(sensor2temp);
        valoresDht11S2Umi.push(sensor2umi);
        valoresDht11S3Temp.push(sensor3temp);
        valoresDht11S3Umi.push(sensor3umi);
        valoresDht11S4Temp.push(sensor4temp);
        valoresDht11S4Umi.push(sensor4umi);
        valoresDht11S5Temp.push(sensor5temp);
        valoresDht11S5Umi.push(sensor5umi);

        if (HABILITAR_OPERACAO_INSERIR) {
            if (AMBIENTE == 'producao') {
                // altere!
                // Este insert irá inserir os dados na tabela "medida"
                // -> altere nome da tabela e colunas se necessário
                // Este insert irá inserir dados de fk_aquario id=1 (fixo no comando do insert abaixo)
                // >> Importante! você deve ter o aquario de id 1 cadastrado.
                sqlquery = `INSERT INTO medida (dht11_umidade, dht11_temperatura, sensor2T, sensor2umi, sensor3temp, momento, fk_aquario) VALUES (${dht11Umidade}, ${dht11Temperatura}, ${sensor2temp}, ${sensor2umi}, ${sensor3temp}, ${sensor3umi}, ${sensor4temp}, ${sensor4umi}, ${sensor5temp}, ${sensor5umi} CURRENT_TIMESTAMP, 1)`;

                // CREDENCIAIS DO BANCO REMOTO - SQL SERVER
                // Importante! você deve ter criado o usuário abaixo com os comandos presentes no arquivo
                // "script-criacao-usuario-sqlserver.sql", presente neste diretório.
                const connStr = "Server=servidor-acquatec.database.windows.net;Database=bd-acquatec;User Id=usuarioParaAPIArduino_datawriter;Password=#Gf_senhaParaAPI;";

                function inserirComando(conn, sqlquery) {
                    conn.query(sqlquery);
                    console.log("valores inseridos no banco: ", dht11Umidade + ", " + dht11Temperatura + ", " + sensor2temp + ", " + sensor2umi + ", " + sensor3temp + ", " + sensor3umi + ", " + sensor4temp + ", " + sensor4umi + ", " + sensor5temp + ", " + sensor5umi)
                }

                sql.connect(connStr)
                    .then(conn => inserirComando(conn, sqlquery))
                    .catch(err => console.log("erro! " + err));

            } else if (AMBIENTE == 'desenvolvimento') {

                // altere!
                // Este insert irá inserir os dados na tabela "medida"
                // -> altere nome da tabela e colunas se necessário
                // Este insert irá inserir dados de fk_aquario id=1 (fixo no comando do insert abaixo)
                // >> você deve ter o aquario de id 1 cadastrado.
                await poolBancoDados.execute(
                    'INSERT INTO medida (dht11_umidade, dht11_temperatura, sensor2temp, sensor2umi, sensor3temp, momento, fk_aquario) VALUES (?, ?, ?, ?, ?, now(), 1)',
                    [dht11Umidade, + ", " + dht11Temperatura, + ", " + sensor2temp + ", " + sensor2umi + ", " + sensor3temp + ", " + sensor3umi + ", " + sensor4temp + ", " + sensor4umi + ", " + sensor5temp + ", " + sensor5umi]
                );
                console.log("valores inseridos no banco: ", dht11Umidade + ", " + dht11Temperatura + ", " + sensor2temp + ", " + sensor2umi + ", " + sensor3temp + ", " + sensor3umi + ", " + sensor4temp + ", " + sensor4umi + ", " + sensor5temp + ", " + sensor5umi)

            } else {
                throw new Error('Ambiente não configurado. Verifique o arquivo "main.js" e tente novamente.');
            }
        }
    });
    arduino.on('error', (mensagem) => {
        console.error(`Erro no arduino (Mensagem: ${mensagem}`)
    });
}


// não altere!
const servidor = (
    valoresDht11Umidade,
    valoresDht11Temperatura,
    valoresDht11S2Temp,
    valoresDht11S2Umi,
    valoresDht11S3Temp,
    valoresDht11S3Umi,
    valoresDht11S4Temp,
    valoresDht11S4Umi,
    valoresDht11S5Temp,
    valoresDht11S5Umi
) => {
    const app = express();
    app.use((request, response, next) => {
        response.header('Access-Control-Allow-Origin', '*');
        response.header('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept');
        next();
    });
    app.listen(SERVIDOR_PORTA, () => {
        console.log(`API executada com sucesso na porta ${SERVIDOR_PORTA}`);
    });
    app.get('/sensores/dht11/umidade', (_, response) => {
        return response.json(valoresDht11Umidade);
    });
    app.get('/sensores/dht11/temperatura', (_, response) => {
        return response.json(valoresDht11Temperatura);
    });
    app.get('/sensores/dht11/s2t', (_, response) => {
        return response.json(valoresDht11S2Temp);
    });
    app.get('/sensores/dht11/s2u', (_, response) => {
        return response.json(valoresDht11S2Umi);
    });
    app.get('/sensores/dht11/s3t', (_, response) => {
        return response.json(valoresDht11S3Temp);
    });
    app.get('/sensores/dht11/s3u', (_, response) => {
        return response.json(valoresDht11S3Umi);
    });
    app.get('/sensores/dht11/s4t', (_, response) => {
        return response.json(valoresDht11S4Temp);
    });
    app.get('/sensores/dht11/s4u', (_, response) => {
        return response.json(valoresDht11S4Umi);
    });
    app.get('/sensores/dht11/s5t', (_, response) => {
        return response.json(valoresDht11S5Temp);
    });
    app.get('/sensores/dht11/s5u', (_, response) => {
        return response.json(valoresDht11S5Umi);
    });
}

(async () => {
    const valoresDht11Umidade = [];
    const valoresDht11Temperatura = [];
    const valoresDht11S2Temp = [];
    const valoresDht11S2Umi = [];
    const valoresDht11S3Temp = [];
    const valoresDht11S3Umi = [];
    const valoresDht11S4Temp = [];
    const valoresDht11S4Umi = [];
    const valoresDht11S5Temp = [];
    const valoresDht11S5Umi = [];
    await serial(
        valoresDht11Umidade,
        valoresDht11Temperatura,
        valoresDht11S2Temp,
        valoresDht11S2Umi,
        valoresDht11S3Temp,
        valoresDht11S3Umi,
        valoresDht11S4Temp,
        valoresDht11S4Umi,
        valoresDht11S5Temp,
        valoresDht11S5Umi
    );
    servidor(
        valoresDht11Umidade,
        valoresDht11Temperatura,
        valoresDht11S2Temp,
        valoresDht11S2Umi,
        valoresDht11S3Temp,
        valoresDht11S3Umi,
        valoresDht11S4Temp,
        valoresDht11S4Umi,
        valoresDht11S5Temp,
        valoresDht11S5Umi
    );
})();
