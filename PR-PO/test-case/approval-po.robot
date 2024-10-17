*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

${LOGIN_URL}    http://devportal.mmproperty.com/login       
${PO_URL}       http://devportal.mmproperty.com/purchaseorder

${EMAIL}        totok.suprapto@mmproperty.com
${PASSWORD}     superFor

${EMAIL_FIELD}         //input[@id='email']                        
${PASSWORD_FIELD}      //input[@id='password']                     
${LOGIN_BUTTON}        //button[@class='btn btn-primary btn-submit' and @type='submit']  

${PO_APPROVAL_TAB}     //a[@href='#tab2']

${REVIEW_BUTTON}       //a[@class='edit btn btn-warning btn-sm']

${APPROVE_BUTTON}      //button[@class='btn-purchase-order-approve2']
${REJECT_BUTTON}       //button[contains(@class, 'btn-purchase-order-reject2')]
${BACK_BUTTON}         //a[@class='btn btn-primary pull-right']

${REMARKS}             //textarea[@id='approval-remarks']
${APPROVE_VAL}         //button[@id='btn-ok']
${REJECT_VAL}          //button[@id='btn-reject']
${VALIDASI}            //button[@class='swal2-confirm swal2-styled']

${REJECT_REASON}       //select[@id='reject_reason']
${REASON}              //option[@value='01']  

${REMARKS_INPUT}       ok

${BROWSER}      Chrome

*** Test Cases ***
Approval Purchase Order
    [Documentation]    This test case simulates the approval process of a purchase order by a Totok Suprapto. The test logs into the application, navigates to the purchase requisition section, and performs the approval action.
    
    Set Selenium Speed    value=0.5
    Open Browser      ${LOGIN_URL}         ${BROWSER}
    Input Text        ${EMAIL_FIELD}       ${EMAIL}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button      ${LOGIN_BUTTON}
    Page Should Contain    MMP Portal

    Go To    ${PO_URL}
    Page Should Contain    Purchasement List
    Click Element   ${PO_APPROVAL_TAB}

    Wait Until Page Contains Element   ${REVIEW_BUTTON}    timeout=30 seconds
    Click Element   ${REVIEW_BUTTON}
    
    Wait Until Element Is Enabled    ${APPROVE_BUTTON}    timeout=30 seconds
    Page Should Contain    PURCHASE ORDER
    Click Button    ${APPROVE_BUTTON}

    Wait Until Page Contains    Approval Remarks
    Input Text    ${REMARKS}    ${REMARKS_INPUT}
    Click Button    ${APPROVE_VAL}
    Click Button    ${VALIDASI}

    Wait Until Page Contains    PURCHASE ORDER    timeout=30 seconds
    Click Element    ${BACK_BUTTON}
    Close Browser

# Approval Reject Purchase Requisition
#     [Documentation]    This test case simulates the rejection approval process of a purchase order by a Superior user. The test logs into the application, navigates to the purchase requisition section, and performs the approval action.
    
#     Set Selenium Speed    value=0.5
#     Open Browser      ${LOGIN_URL}         ${BROWSER}
#     Input Text        ${EMAIL_FIELD}       ${EMAIL}
#     Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
#     Click Button      ${LOGIN_BUTTON}
#     Page Should Contain    MMP Portal

#     Go To    ${PO_URL}
#     Page Should Contain    Purchasement List
#     Click Element   ${PO_APPROVAL_TAB}

#     Wait Until Page Contains Element   ${REVIEW_BUTTON}
#     Click Element   ${REVIEW_BUTTON}

#     Page Should Contain    PURCHASE ORDER
#     Click Button    ${REJECT_BUTTON}

#     Wait Until Page Contains    Reject Reason
#     Click Element    ${REJECT_REASON}    
#     Click Element    ${REASON}
#     Click Button     ${REJECT_VAL}
#     Click Button     ${VALIDASI}

#     Wait Until Page Contains    PURCHASE ORDER    timeout=30 seconds
#     Click Button    ${BACK_BUTTON}
#     Location Should Be    ${PO_URL}
#     Close Browser
