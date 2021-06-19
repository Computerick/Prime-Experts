*** Settings ***
Documentation    Aqui estarão presentes os nossos primeiros fluxos de automação
...              web e respectivos cenários automátizados.

Resource            ../resource/keywords/kws_automation2.robot

    
Test Setup        Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search" "ItemNãoExistente"
