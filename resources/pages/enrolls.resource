*** Settings ***
Documentation    Kaywords que representam a página de cadastro de matrículas

Library    Browser
Library    libs/DateTricks.py
Library    FakerLibrary

*** Keywords ***
Go to enrolls
    Click    css=a[href="/matriculas"]

Go to enrolls form
    Click    css=a[href="/matriculas/new"]

Select student
    [Arguments]    ${student}
    Fill Text    xpath=//div[contains(text(), "nome do aluno")]/..//input
    ...    ${student}
    Click    css=div[class$=option] >> text=${student}

Select plan
    [Arguments]    ${plan}
    Click    xpath=//label[text()="PLANO"]/..//div[contains(text(), "Selecione")]
    Click    css=div[class$=menu] >> text=${plan}

Select date
    Focus    css=input[name=start_date]

    ${start_date}    Get start date

    FOR    ${number}    IN    @{start_date}
        Keyboard Key    press    ${number}
    END

    # Keyboard Key    press    1
    # Keyboard Key    press    8
    # Keyboard Key    press    0
    # Keyboard Key    press    9
    # Keyboard Key    press    2
    # Keyboard Key    press    0
    # Keyboard Key    press    2
    # Keyboard Key    press    4

Submmit enroll form
    Click    css=button >> text=Salvar