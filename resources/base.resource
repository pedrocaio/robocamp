*** Settings ***
Documentation    Tudo começa aqui

Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enrolls.resource

*** Keywords ***
# Helpers
Do login
    [Arguments]    ${user}

    Go to login Page
    Fill credentials    ${user}[email]    ${user}[pass]
    Submit credentials
    User should be logged in    ${user}[name]