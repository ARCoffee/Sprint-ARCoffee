var database = require("../database/config");

function buscarUltimasMedidas() {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas}
        temperatura, 
        umidade,  
        dataHora,
                FORMAT(dataHora, 'HH:mm:ss') as momento_grafico
                from historicoSensor
                order by idHistoricoSensor desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        temperatura, 
        umidade,
        dataHora,
                DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                from historicoSensor
                where fk_Armazem = ${idArmazem}
                order by idHistoricoSensor desc limit ${limite_linhas}`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idArmazem) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1
        temperatura, 
        umidade,  
                CONVERT(varchar, dataHora, 108) as momento_grafico, 
                fk_Armazem
                from historicoSensor where fk_Armazem = ${idArmazem} 
                order by idHistoricoSensor desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        temperatura, 
        umidade,
                DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
                fk_Armazem 
                from medida where fk_Armazem = ${idArmazem} 
                order by idHistoricoSensor desc limit 1`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
