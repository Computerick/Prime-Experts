*** Test Cases ***
Cenario: Contar com FOR e IF
    [Tags]    COUNTIF
    FOR    ${num}    IN RANGE    0    10
        IF    ${num} == 5
            Log To Console    \nEstou no número:${num} de 0 a 10
        ELSE IF    ${num} == 8
            Log To Console    \nEstou no número:${num} de 0 a 10
        END
    END

Cenario: Contar de 0 a 10
    FOR    ${count}    IN RANGE     0    11
        Log To Console    \nEstou no numero: ${count}
    END    

Cenario: Imprimir nome de paises
    @{PAISES}    Create List    Brasil    Japão    India    EUA
    FOR    ${pais}    IN    @{PAISES}
        Log To Console    \nEstou no seguinte país:${pais}
    END

*** Keywords ***
Contar de 0 a 10
    FOR    ${numero}    IN RANGE     0    11
        Log To Console    \nEstou no número:${numero}
    END

    
