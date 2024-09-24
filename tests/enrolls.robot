*** Settings ***
Documentation        Suite de testes de matrícula de alunos
...                  Administrador, uma vez logado, consegue matricular alunos na academia

Resource    ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    ${admin}        Get fixture    admin
    ${student}      Get fixture    student

    Reset student enroll    ${student}[email]

    Do login    ${admin}

    Go to enrolls
    Go to enrolls form
    Select student    ${student}[name]
    Select plan    ${student}[enroll][plan]
    Select date
    Submmit enroll form
    Verify toaster    Matrícula cadastrada com sucesso