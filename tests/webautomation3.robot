*** Settings ***
Documentation    Aqui estarão presentes os nossos primeiros fluxos de automação
...              web e respectivos cenários automátizados.

Resource            ../resource/keywords/kws_automation3.robot

    
Test Setup        Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 03: Listar Produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página