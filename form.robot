*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${BROWSER}              Chrome
${VALID_NAME_TH_1}      นาย
${VALID_NAME_TH_2}      นาง
${VALID_NAME_TH_3}      นางสาว
${VALID_FIRSTNAME_TH}   สุภาณี
${VALID_LASTNAME_TH}    รังสิรัตน์
${VALID_NAME_EN_1}      Mr.
${VALID_NAME_EN_2}      Mrs.
${VALID_NAME_EN_3}      Ms.
${VALID_FIRSTNAME_EN}   Supanee
${VALID_LASTNAME_EN}    Rungsirat
${DAY}                  27
${MONTH}                มิถุนายน
${YEAR}                 2003
${VALID_ID_CARD}        2546257894125
${VALID_PASSWORD}       PasswordXd555
${VALID_PHONE_NUMBER}   0986574123
${VALID_EMAIL_WEBMAIL}  Samind2@webmail.npru.ac.th

*** Test Cases ***
Successfully signed up
    Open Signup Form
    Input TH Information
    Input EN Information
    Input Birthday
    Input ID Card
    Input Password
    Input Phone Number
    Input Email
    Input Checkbox
    Click Button
    Verify Signup Results
    Close Browser

Check Invalid Name TH
    Open Signup Form
    Wait Until Page
    Input Invalid TH Name
    Click Space
    Verify Invalid Name TH Only
    Close Browser

Check Invalid Name EN
    Open Signup Form
    Wait Until Page
    Input Invalid EN Name
    Click Space
    Verify Invalid Name EN Only
    Close Browser

Check Invalid ID Card
    Open Signup Form
    Wait Until Page
    Input Invalid ID Card
    Click Space
    Verify Invalid ID Card Only
    Close Browser

*** Keywords ***
Open Signup Form
    Open Browser    http://localhost:5173/    ${BROWSER}

Wait Until Page
    Wait Until Page Contains Element    id=root

Input TH Information
    Select From List by Value    id=nameTitleTha    ${VALID_NAME_TH_1}
    Input Text    id=firstnameTha    ${VALID_FIRSTNAME_TH}
    Input Text    id=lastnameTha     ${VALID_LASTNAME_TH}

Input EN Information
    Select From List by Value    id=nameTitleEng    ${VALID_NAME_EN_1}
    Input Text    id=firstnameEng    ${VALID_FIRSTNAME_EN}
    Input Text    id=lastnameEng     ${VALID_LASTNAME_EN}

Input Birthday
    Select From List by Value    id=birthDate    ${DAY}
    Select From List by Label    id=birthMonth    ${MONTH}
    Select From List by Label    id=birthYear    ${YEAR}

Input ID Card
    Input Text    id=idCard    ${VALID_ID_CARD}

Input Password
    Input Text    id=password    ${VALID_PASSWORD}

Input Phone Number
    Input Text    id=mobile    ${VALID_PHONE_NUMBER}

Input Email
    Input Text    id=email    ${VALID_EMAIL_WEBMAIL}

Input Checkbox
    Execute JavaScript    document.getElementById('accept').click()

Click Button
    Execute JavaScript    document.getElementById('submitbtn').click()

Verify Signup Results
    Page Should Contain    Submitting...

Input Invalid TH Name
    Select From List by Value    id=nameTitleTha    ${VALID_NAME_TH_1}
    Input Text    id=firstnameTha    Supanee
    Input Text    id=lastnameTha     Rungsirat

Input Invalid EN Name
    Select From List by Value    id=nameTitleEng    ${VALID_NAME_EN_1}
    Input Text    id=firstnameEng    สุภาณี
    Input Text    id=lastnameEng     รังสิรัตน์

Input Invalid ID Card
    Input Text    id=idCard    S546257894125

Verify Invalid Name TH Only
    Page Should Contain    Must be in Thai only

Verify Invalid Name EN Only
    Page Should Contain    Must be in English only

Verify Invalid ID Card Only
    Page Should Contain    Number only
