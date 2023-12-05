var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O FUNCIONARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT empresa.nome as nome, cnpj, contato, plano, fk_empresa as empresaId FROM funcionario join empresa on fk_Empresa = idEmpresa WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, email, senha) {
    console.log("ACESSEI O FUNCIONARIO MODEL \n \n\tk_Empresa\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO funcionario (nome, email, senha, fk_Empresa) VALUES ('${nome}', '${email}', '${senha}', (select idEmpresa from empresa where nome = "${nome}"));
    `;
    /*(SELECT idEmpresa from Empresa where cnpj = '${cnpj}') Arrumar para se adequar com a tabela empresa*/
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function empresa(nome, plano, telefone, cnpj) {
    var instrucao = `
    INSERT INTO empresa (nome, plano, contato, cnpj) VALUES ('${nome}', '${plano}', '${telefone}', '${cnpj}');
`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function cadastrarFuncionario(nome, email, senha, fk_Empresa) {
    var instrucao = `
        INSERT INTO funcionario (nome, email, senha, fk_Empresa) VALUES ('${nome}', '${email}', '${senha}, '${fk_Empresa}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function armazens(fk_Empresa) {
    var instrucao = `
         select * from Armazem where fk_Empresa = ${fk_Empresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    autenticar,
    cadastrar,
    cadastrarFuncionario,
    empresa,
    armazens
};