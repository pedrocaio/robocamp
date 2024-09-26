*** Settings ***
Documentation    Geranciando a massa de testes através do banco de dados

Library    DatabaseLibrary

*** Keywords ***
Connect to postgres
    Connect To Database    psycopg2
    ...                    tlkmyazn
    ...                    tlkmyazn
    ...                    6f_k3tMh31D2L4pyUTVwV3nAVsXY9Cbc
    ...                    isabelle.db.elephantsql.com
    ...                    5432


Select student where email
    [Arguments]    ${email}

    ${query}    Set Variable
    ...         SELECT * FROM public.students WHERE email = '${email}';

    ${result}    Query    ${query}

    [RETURN]    ${result}[0]

Delete enroll by email
    [Arguments]    ${email}

    ${user}     Select student where email    ${email}

    ${query}    Set Variable
    ...         DELETE FROM public.enrollments WHERE student_id = '${user}[0]';

    Execute Sql String    ${query}

Delete student by email
    [Arguments]    ${email}

    ${query}       Set Variable
    ...            DELETE FROM public.students WHERE email = '${email}';

    Execute Sql String    ${query}

#Helpers
Reset student
    [Arguments]    ${email}

    Connect to postgres
    Delete student by email    ${email}
    Disconnect From Database