function loadkpi() {
    fetch(`/medidas/kpi`, {cache: 'no-store'
    }).then(function (resposta) {
        if (resposta.ok) {
                console.log(`Dados recebidos: ${JSON.stringify(resposta)}`)
                resposta.json().then(json => {
                    console.log(json);
                    console.log(JSON.stringify(json));
                    kpi1min.innerHTML = json[0].minTemp;
                    kpi1time1.innerHTML = json[0].dtMinTemp;
                    kpi1max.innerHTML = json[0].maxTemp;
                    kpi1time2.innerHTML = json[0].dtMaxTemp;
                    kpi2min.innerHTML = json[0].minUmi;
                    kpi2time1.innerHTML = json[0].dtMinUmi;
                    kpi2max.innerHTML = json[0].maxUmi;
                    kpi2time2.innerHTML = json[0].dtMaxUmi;
                    kpi3hour1.innerHTML = json[0].tempoTemp;
                    kpi3hour2.innerHTML = json[0].tempoUmi;
                });
                // setInterval(loadkpi(), 10000)
        
        } else {
            console.error('Nenhum dado encontrado ou erro na API');
        }
    }).catch(function (error) {
        console.error(`Erro na obtenção dos dados p/ gráfico: ${error.message}`);
    });
}