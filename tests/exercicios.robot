*** Settings ***
#Dentro do documentation estarão presente informações a respeito do arquivo.
Documentation    Aqui estaram presentes todos os exercícios do Prime Experts
...              focado em imersão com Robot.
*** Variables ***
# Minha Primeira Variável Simples
${NOME}
...         Erick Félix

# Minha Primeira Variável tipo dicionário
&{PESSOA}      
...         nome=Erick    
...         sobrenome=Félix
...         idade=27

#Variável dicionário 1º exercicio
&{LOGRADOURO}
...        rua=Av. Brasil
...        numcasa=10
...        bairro=Ramos
...        cidade=Rio de Janeiro
...        uf=RJ
...        cep=21030-000

#Minha Primeira Variável tipo lista
@{FRUTAS}    
...         Banana
...         Maçã 
...         Abacaxi
...         Morango
...         Pêra

*** Test Cases ***
Cenario: Imprimir o dicionário
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.sobrenome}
Cenario: Imprimir o logradouro(Exercicio1)
    [Tags]            TESTE
    Log To Console    \n ${LOGRADOURO.rua}
    Log To Console    \n ${LOGRADOURO.numcasa}
    Log To Console    \n ${LOGRADOURO.bairro}
    Log To Console    \n ${LOGRADOURO.cidade}
    Log To Console    \n ${LOGRADOURO.uf}
    Log To Console    \n ${LOGRADOURO.cep} 
Cenario: Imprimir Frutas(Exercicio2)
    Log To Console    \n ${FRUTAS[0]}
    Log To Console    \n ${FRUTAS[1]}
    Log To Console    \n ${FRUTAS[2]}
    Log To Console    \n ${FRUTAS[3]}
    Log To Console    \n ${FRUTAS[4]}
    Log To Console    \n ${FRUTAS}

Cenario Realizar soma:
    [Tags]    SOMA
    ${RESULTADO}    Somar dois numeros    10     30
    
Cenario: Meu Teste soma
    [Tags]    SOMA_2
    ${RESULTADO}    Somar dois numeros "55" e "44"
    Log To Console    ${RESULTADO}

Cenario: Contando de 0 a 9
    [Tags]    COUNT
    FOR    ${count}    IN RANGE     0    10
        Log To Console    ${count}
    END

Cenario: Imprimir Frutas da Lista
    [Tags]    FRUTAS
        @{FRUTAS}    Create List    Morango    Pera    Banana    Uva   
    FOR    ${fruta}    IN     @{FRUTAS}
        Log To Console    ${fruta}
    END

*** Keywords ***
Somar dois numeros
    [Arguments]    ${NUM_A}    ${NUM_B}
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}
    Log To Console    ${SOMA}

Somar dois numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}

