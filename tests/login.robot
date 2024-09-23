*** Settings ***
Documentation        Suite de testes de autenticação
...                  Administrador deve conseguir acessar o portal de gestão de academias

Resource    ../resources/base.resource

*** Test Cases ***
Login do Administrador
    Go to login Page
    Fill credentials    admin@smartbit.com    qacademy
    Submit credentials
    User should be logged in    Admin

Email não tabulado
    Go to login Page
    Fill credentials    404@smartbit.com    qacademy
    Submit credentials
    Verify toaster    Suas credenciais são inválidas, por favor tente novamente!

Senha incorreta
    Go to login Page
    Fill credentials    admin@smartbit.com    abc123
    Submit credentials
    Verify toaster    Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto
    Go to login Page
    Fill credentials    @.com.br    abc123
    Submit credentials
    Field type should be email

Email em branco
    Go to login Page
    Fill credentials    ${EMPTY}    qacademy
    Submit credentials
    Alert text should be    email    O e-mail é obrigatório

Senha em branco
    Go to login Page
    Fill credentials    admin@smartbit.com    ${EMPTY}
    Submit credentials
    Alert text should be    password    A senha é obrigatória

Email e senha são obrigatórios
    Go to login Page
    Submit credentials
    Alert text should be    email    O e-mail é obrigatório
    Alert text should be    password    A senha é obrigatória