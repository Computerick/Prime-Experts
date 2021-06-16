*** Settings ***
# Dentro de documentation estarão presentes as informações a respeito do arquivo.
Documentation    Aqui estará presente o exercicio proposto para fixação do aprendizado:
...             Crie um e-mail a partir de informações do nome, sobrenome e idade. Com 
...             o seguinte formato "nome_sobrenome_idade@robot.com"
          
***Variables***
${NOME}
...    João
${SOBRENOME}
...    Silva
${IDADE}
...    18
${PROV_EMAIL}
...    @robot.com

*** Test Cases ***
Cenario formação do e-mail:
    [Tags]    novoemail
   ${DADOS}    Dados para email    ${NOME}    ${SOBRENOME}    ${IDADE}    ${PROV_EMAIL}
    Log To Console    ${DADOS}

*** Keywords ***
Dados para email
    [Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}    ${PROV_EMAIL}
    ${NOVOEMAIL}    Catenate    SEPARATOR=_       ${NOME}    ${SOBRENOME}    ${IDADE}    ${PROV_EMAIL}
    [Return]    ${NOVOEMAIL}
    Log To Console    ${NOVOEMAIL}