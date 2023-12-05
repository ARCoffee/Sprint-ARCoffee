var usuarioModel = require("../models/usuarioModel");
var aquarioModel = require("../models/aquarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    }
    // else if (senha < 6) {
    //     res.status(400).send("Sua senha precisar ter no min 6 digitos!");
    // } else if (email.indexOf('@') == -1 ||
    // email.indexOf('.') == -1) {
    //     res.status(400).send("Seu email está inválido!");
    // } 
    else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        
                            res.json({
                                //empresa.nome as nome, cnpj, contato, plano, fk_empresa as empresaId
                                id: resultadoAutenticar[0].empresaId,
                                cnpj: resultadoAutenticar[0].cnpj,
                                nome: resultadoAutenticar[0].nome,
                                contato: resultadoAutenticar[0].contato,
                                plano: resultadoAutenticar[0].plano,
                            });
                        
                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }
    else if (nome.length < 1) {
        res.status(400).send("Seu campo nome está vazio!");
    }
    else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    }
    else if (email.indexOf('@') == -1 || email.indexOf('.') == -1) {
        res.status(400).send("Seu email está inválido!");
    }
    else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    }
    else if (senha < 6) {
        res.status(400).send("Sua senha precisar ter no min 6 digitos!");
    }
    else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, senha)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function empresa(req, res) {
    var nome = req.body.nomeServer;
    var plano = req.body.planoServer;
    var telefone = req.body.telefoneServer;
    var cnpj = req.body.cnpjServer;

    usuarioModel.empresa(nome, plano, telefone, cnpj)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}


function cadastrarFuncionario(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;


    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }
    else if (nome.length < 1) {
        res.status(400).send("Seu campo nome está vazio!");
    }
    else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    }
    else if (email.indexOf('@') == -1 || email.indexOf('.') == -1) {
        res.status(400).send("Seu email está inválido!");
    }
    else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    }
    else if (senha < 6) {
        res.status(400).send("Sua senha precisar ter no min 6 digitos!");
    }
    else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarFuncionario(nome, email, senha)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}


module.exports = {
    autenticar,
    cadastrar,
    cadastrarFuncionario,
    empresa
}