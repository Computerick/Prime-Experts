*** Settings ***
Documentation    Aqui estarão presentestodas as keywords
...              que compõe testes d eautomação web

Library    SeleniumLibrary
Library    String

***Variables***
${BROWSER}    chrome
${URL}        http://automationpractice.com
${CATEGORIA}    Summer Dresses


*** Keywords ***
#Setup e Teardown
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a página home do site
    Go To    ${URL}
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul
    Title Should Be    My Store

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    #Input Text    name=search_query    ${PRODUTO}
    Mouse Down On Link    xpath=//*[@id="block_top_menu"]/ul/li[1]/a

Clicar na sub categoria "${CATEGORIA}"
    Double Click Element    xpath=(//a[contains(@title,'Summer Dresses')])[1]

Conferir se os produtos da sub-categoria "${CATEGORIA}" foram mostrados na página
    Title Should Be                  Summer Dresses - My Store

  
    Page Should Contain Image        xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/1/2/12-home_default.jpg"]
    Page Should Contain Image        xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/1/6/16-home_default.jpg"]                                                
    Capture Page Screenshot

# Conferir mensagem "No results were found for your search" "${PRODUTO}"
#     Wait Until Element Is Visible    xpath=//*[@id="center_column"]
#     Title Should Be                  Search - My Store
#     Page Should Contain Link         xpath=//p[contains(.,'No results were found for your search "Itemnãoexistente"')]
#     Capture Page Screenshot