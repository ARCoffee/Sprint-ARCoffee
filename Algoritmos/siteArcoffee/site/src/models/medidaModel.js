var database = require("../database/config");

function buscarUltimasMedidas(idArmazem, limite_linhas) {

        instrucaoSql = `select 
        temperatura, 
        umidade,
        dataHora,
                DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                from historicoSensor
                where fk_Armazem = ${idArmazem}
                order by idHistoricoSensor desc limit ${limite_linhas}`;
    

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

function buscarMedidasEmTempoReal(idArmazem) {

        instrucaoSql = `select 
        temperatura, 
        umidade,
                DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
                fk_Armazem 
                from historicoSensor 
                where fk_Armazem = ${idArmazem} 
                order by idHistoricoSensor desc limit 1`;


    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
    
}
function buscarKPI(){
    instrucaoSql = ``
    instrucaoSql = 'select * from vw_tempUmiMinMax;'
    
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarKPI
}
