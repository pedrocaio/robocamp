*** Settings ***
Library    Browser

*** Keywords ***
Go to login Page
    New Browser    headless=false    browser=chromium
    New Page       http://localhost:3000

Fill credentials
    [Arguments]    ${email}    ${pass}

    Fill Text    input[placeholder="Seu e-mail"]        ${email}
    Fill Text    input[placeholder="Sua Senha"]         ${pass}

Submit credentials
    Click    css=button >> text=Entrar no sistema

Field type should be email
    Get Attribute    css=input[placeholder="Seu e-mail"]    type    equal    email

Alert text should be
    [Arguments]    ${field}    ${expected_text}

    # Wait For Elements State    css=span >> text=${expected_text}    visible    5
    Get Text    xpath=//input[@type="${field}"]/..//span    equal    ${expected_text}