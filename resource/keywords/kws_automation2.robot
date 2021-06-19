*** Settings ***
Documentation    Aqui estarão presentestodas as keywords
...              que compõe testes d eautomação web

Library    SeleniumLibrary
Library    String

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
    Go To    ${URL}
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    name=search_query    ${PRODUTO} 

Clicar no botão pesquisar
    Click Element    name=submit_search

Conferir mensagem "No results were found for your search" "${PRODUTO}"
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/h1
    Title Should Be                  Search - My Store
    
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]//*[@class="alert alert-warning"]
    Capture Page Screenshot