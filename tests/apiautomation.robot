*** Settings ***
Documentation    Aqui estarão todos os cenarios de testes API

Resource    ../resource/keywords/kws_apiautomation.robot
Suite Setup    Requisitar todos os livros 


*** Test Cases ***
Cenario: Buscar a listagem de todos os livros (GET em todos os livros)
    [Tags]    Test2
    Requisitar todos os livros
    Conferir o status code    200
    Conferir o reason         OK
    Conferir se retoma uma lista com "200" livros

Cenario: Buscar aum livro especifico(GET em um livro especifico)
    [Tags]    Test1
    Requisitar todos os livros
    Conferir o status code    200
    Conferir o reason         OK
    Conferir se retoma uma lista com "200" livros

Cenario: Cadastrar um novo livro (POST)
    Cadastrar um novo livro
    Conferir o status code    200
    Conferir o reason          ok
    Conferir se retorna os dados cadastrados do livro "200"