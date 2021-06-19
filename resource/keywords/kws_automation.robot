*** Settings ***
Documentation    Aqui estarão presentestodas as keywords
...              que compõe testes d eautomação web

Library        SeleniumLibrary
Library        String

***Variables***
${BROWSER}    chrome
${URL}        http://automationpractice.com

*** Keywords ***
#Setup e Teardown
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a página home do site Automation Practice
    Go To                                ${URL}
    Wait Until Element Is Visible        xpath=//*[@id="block_top_menu"]/ul
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    name=search_query    ${PRODUTO} 

Clicar no botão pesquisar
    Click Element    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/h1
    Title Should Be                  Search - My Store
    Page Should Contain Image        xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/7/7-home_default.jpg"]
    Page Should Contain Link         xpath=//*[@id="center_column"]//*[@class="product-name"][contains(text(), "Blouse")]
    Capture Page Screenshot
