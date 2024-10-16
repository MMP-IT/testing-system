*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

${LOGIN_URL}    http://devportal.mmproperty.com/login       
${PR_URL}       http://devportal.mmproperty.com/purchaserequisition

${EMAIL}        arief.wibowo@mmproperty.com
${PASSWORD}     superFor

${EMAIL_FIELD}         //input[@id='email']                        
${PASSWORD_FIELD}      //input[@id='password']                     
${LOGIN_BUTTON}        //button[@class='btn btn-primary btn-submit' and @type='submit']  

${PO_APPROVAL_TAB}     //a[@href='#tab2']
${BIDDING_LIST_TAB}    //a[@href='#tab3']
${HISTORY_TAB}         //a[@href='#tab1']

${EDIT_BUTTON}         //a[contains(@class, 'edit') and contains(@class, 'btn-warning')][1]

${DETAIL_BUTTON}       //a[contains(@class='btn btn-danger')]
${BIDDING_BUTTON}      //a[contains(@class='btn btn-info')]
${BACK_BUTTON}         //a[@href='/purchaseorder']

${BROWSER}      Chrome

*** Test Cases ***
Login Portal
    [Documentation]    Login to portal

    Open Browser      ${LOGIN_URL}         ${BROWSER}
    Input Text        ${EMAIL_FIELD}       ${EMAIL}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button      ${LOGIN_BUTTON}
    Page Should Contain    MMP Portal

    Go To    ${PR_URL}
    Page Should Contain    Purchasement List

    Click Element   ${PO_APPROVAL_TAB}
    Wait Until Page Contains Element   ${EDIT_BUTTON}
    Click Element   ${EDIT_BUTTON}