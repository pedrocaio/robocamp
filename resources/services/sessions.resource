*** Settings ***
Documentation    Consuimndo a rota services da API REST

Library    RequestsLibrary
Resource    ../base.resource

*** Keywords ***
Get services token

    [Arguments]    ${user}

    ${response}    POST    http://localhost:3333/sessions
    ...            json=${user}
    ...            expected_status=200

    ${token}    Set Variable    Bearer ${response.json()}[token]

    [Return]    ${token}