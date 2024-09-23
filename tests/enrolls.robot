*** Settings ***
Documentation        Suite de testes de matrícula de alunos
...                  Administrador, uma vez logado, consegue matricular alunos na academia

Resource    ../resources/base.resource
Library    OperatingSystem

*** Test Cases ***
Deve matricular um aluno
    ${admin}        Create Dictionary
    ...    email=admin@smartbit.com
    ...    pass=qacademy
    ...    name=Admin

    Do login    ${admin}

    Go to enrolls
    Go to enrolls form
    Select student    Falcão
    Select plan    Smart
    Select date