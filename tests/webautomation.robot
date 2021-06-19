*** Settings ***
Documentation    Aqui estarão presentes os nossos primeiros fluxos de automação
...              web e respectivos cenários automátizados.

Resource          ../resource/keywords/kws_automation.robot
   
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste 01: Pesquisar produtos existentes
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site