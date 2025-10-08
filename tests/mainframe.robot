*** Settings ***
Library    Mainframe3270

*** Variables ***
${HOST}    Y:wdc3270.sna.cigna.com
${USERNAME}    C8t3dw
${PASSWORD}    Virat@18
${APP_NAME}    Tso2

*** Test Cases ***
Automate Mainframe Login and Navigation
    Mainframe3270.Open Connection    ${HOST}
    Mainframe3270.Wait Field Detected
    Mainframe3270.Wait Until String    ENTER APPLICATION NAME:
    Mainframe3270.Page Should Contain String    ENTER APPLICATION NAME:

    Mainframe3270.Write    ${APP_NAME}
    Mainframe3270.Press Key    ENTER

    Mainframe3270.Write    ${USERNAME}
    Mainframe3270.Press Key    ENTER

    Mainframe3270.Write    ${PASSWORD}
    Mainframe3270.Press Key    ENTER

    Mainframe3270.Press Key    ENTER
    Sleep    1s
    Mainframe3270.Press Key    ENTER
    Sleep    1s

    ${pos}=    Mainframe3270.Get String Position    ===>
    Mainframe3270.Move Cursor To    ${pos}[0]    ${pos}[1]
    Mainframe3270.Move Next Field
    Mainframe3270.Write    3.4
    Mainframe3270.Press Key    ENTER

    ${ds_pos}=    Mainframe3270.Get String Position    Dsname Level...
    Mainframe3270.Move Cursor To    ${ds_pos}[0]    ${ds_pos}[1]
    Mainframe3270.Move Next Field
    Mainframe3270.Write    TEST.MEMBER.TEST
    Mainframe3270.Press Key    ENTER

    Mainframe3270.Move Cursor To    ${ds_pos}[0]    ${ds_pos}[1]
    Mainframe3270.Write    TEST.MEMBER.INTO120.TEST
    Mainframe3270.Press Key    ENTER
