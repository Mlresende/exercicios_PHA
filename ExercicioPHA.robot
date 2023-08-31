*** Settings ***
Library    String
Library    OperatingSystem
Library    DateTime

*** Variables ***
&{PESSOA}       nome=Miguel    sobrenome=Resende    idade=20    rua=São benedito do rio preto    cep=03912-010    numero=375    bairro=Jardim Tango    cidade=São Paulo    estado=SP
@{Frutas}       Laranja    Maça    Uva    Goiaba    Tomate    Kiwi

*** Keywords ***
# 1 - Exercício Dicionário
Exibir nome, idade, rua, numero, cep, bairro, cidade e estado no console a partir de um dicionário.
    Log To Console    \n
    Log to console    ${PESSOA.nome}        \n
    Log To Console    ${PESSOA.idade}       \n
    Log To Console    ${PESSOA.rua}         \n
    Log To Console    ${PESSOA.numero}      \n
    Log To Console    ${pessoa.cep}         \n
    Log To Console    ${pessoa.bairro}      \n
    Log To Console    ${pessoa.cidade}      \n
    Log To Console    ${pessoa.estado}      \n      
    Log To Console    \n

# 2 - Exercício Argumentos e Retornos + If Simples
O usuário tem ${IDADE} anos, exibir o ano de nascimento ou se o usuario nasceu no século passado.
    Log To Console    \n
    ${ANO}    Get Current Date
    ${RESULTADO}    Subtract Date From Date    ${ANO}    ${IDADE}    years
    IF  ${RESULTADO} >= 2000 
        Log To Console    O ano de nascimento do Usuário é: ${RESULTADO}
    ELSE
        Log To Console    O usuário nasceu no século passado.
    END
    Log To Console    \n

# 3 - Exercício For Simples + Lista 
Exiba cada uma das frutas de uma lista usando um For Simples
    Log To Console    \n
    FOR    ${ELEMENTOS}    IN    @{Frutas}
    Log To Console    ${ELEMENTOS}    \n
    END
    Log To Console    \n

# 4 - Exercício If Inline + For in Range
Crie um loop que conte quantos números par existem entre 0 e 10, usando if inline
    Log To Console    \n
    ${Contador}=    Set Variable    0
    FOR  ${indice}  IN RANGE    0     11    
    ${Contador}    IF   ${indice} % 2 == 0    Set Variable    ${{ ${Contador} + 1}}    ELSE    Set Variable    ${Contador}
    END
    Log To Console    Existem ${Contador} números pares.
    Log To Console    \n

*** Test Cases ***
Exibir Dicionario no Console
    Exibir nome, idade, rua, numero, cep, bairro, cidade e estado no console a partir de um dicionário.

Exibir lista de Frutas adicionadas.
    Exiba cada uma das frutas de uma lista usando um For Simples

Exibir Argumentos de retorno + if simples
    O usuário tem 20 anos, exibir o ano de nascimento ou se o usuario nasceu no século passado.

Exercício If Inline + For in Range
    Crie um loop que conte quantos números par existem entre 0 e 10, usando if inline


