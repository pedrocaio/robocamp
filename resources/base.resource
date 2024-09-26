*** Settings ***
Documentation    Tudo começa aqui

Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enrolls.resource

Resource    services/sessions.resource
Resource    services/students.resource

Resource    database.resource

Library     JSONLibrary

*** Keywords ***
# Helpers
Do login
    [Arguments]                 ${user}

    Go to login Page
    Fill credentials            ${user}[email]    ${user}[password]
    Submit credentials
    User should be logged in    ${user}[name]

Get fixture
    [Arguments]    ${fixture_file}

    ${fixture}     Load Json From File    
    ...            ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...            encoding=UTF-8

    [RETURN]       ${fixture}