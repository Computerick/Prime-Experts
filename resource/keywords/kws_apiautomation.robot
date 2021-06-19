*** Settings ***
Documentation        Aqui estarão os teste referentes as API's de Books

Library        RequestsLibrary
Library        Collections
Resource    ../resource/keywords/kws_automation3.robot

*** Variables ***
${BASE_URL}        https://fakerestapi.azurewebsites.net/api/v1
#endpoints-Books

${JSON_POST}
...    id=201
...    title="Book 201"
...    descripition="Estamos testando o Post API"
...    pageCount=6000
...    excerpt="Testando Api"
...    publichDate="2021-05-29T23"


*** Keywords ***
Requisitar todos os livros
    Create Session        fakeAPI    ${BASE_URL}    disable_warnings=${True}
    ${HEADERS}        Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}
    ${RESPOSTA}    Get On Session    fakeAPI    Books/${ID_LIVRO}    expected_status=any
    Log         ${RESPOSTA.text}
    Set Test Variable      ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    Dictionary Should Contain Item    ${ID_LIVRO}

Conferir se retorna os dados corretos do livro 20
    Dictionary Should Contain Item    ${RESPOSTA.json}    id    20
    Dictionary Should Contain Item    ${RESPOSTA.json}    title    Book 20
    Dictionary Should Contain Item    ${RESPOSTA.json}    pageCount    2000
    Should Not Be Empty    ${RESPOSTA.json()["descripition"]}
    Should Not Be Empty    ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty    ${RESPOSTA.json()["publichDate"]}

Conferir o status code    
    [Arguments]    ${STATUS_CODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUS_CODE_DESEJADO}
       

Conferir o reason 
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retoma uma lista com "${QTDE_LIVRO}" livros
    Length Should Be    ${RESPOSTA.json()}    ${QTDE_LIVRO}

Cadastrar um novo livro
    Set Suite Variable    ${JSON_BODY}    ${JSON_POST}
    ${RESPOSTA}        Post On Session    FakeAPI    Books    
    ...                Json=${JSON_BODY}
    ...                headers=${HEADERS}    expected_status=any
    Log                ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA} 

Conferir se retorna os dados cadastrados do livro "${ID_LIVRO}"
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id             ${JSON_POST.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title          ${JSON_POST.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description    ${JSON_POST.descreption}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount      ${JSON_POST.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt        ${JSON_POST.excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate    ${JSON_POST.publishDate}