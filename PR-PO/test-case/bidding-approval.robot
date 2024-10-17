*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

${LOGIN_URL}    http://devportal.mmproperty.com/login       
${PO_URL}       http://devportal.mmproperty.com/purchaseorder

${EMAIL_1}      ricca.sumarni@mmproperty.com
${EMAIL_2}      totok.suprapto@mmproperty.com
${EMAIL_1}      carlina.@mmproperty.com
${PASSWORD}     superFor

${EMAIL_FIELD}         //input[@id='email']                        
${PASSWORD_FIELD}      //input[@id='password']                     
${LOGIN_BUTTON}        //button[@class='btn btn-primary btn-submit' and @type='submit']  

${BIDDING_LIST_TAB}    //a[@href='#tab3']

${REVIEW_BUTTON}       (//a[@class='edit btn btn-info btn-sm'])[2]
${APPROVE_BUTTON}      //button[@class='bid-approval']
${REJECT_BUTTON}       //button[@class='bid-reject']
${APPROVE_VAL}         //button[@id='btn-ok']
${REJECT_VAL}          //button[@id='btn-approval']
${VAL_BUTTON}          //button[@class='swal2-confirm btn btn-success']

${REMARKS}             //textarea[@id='approval-remarks']

${REMARKS_APPROVE}    OK
${REMARKS_REJECT}     Salah

${BROWSER}      Chrome

*** Test Cases ***

# Approve Bidding by Dep. Head Purchasing
#     [Documentation]    This test case simulates the approval process of a bidding by Ricca Sumarni. The test logs into the application, navigates to the bidding section, and performs the approval action.
    
#     Set Selenium Speed    value=0.5
#     Open Browser      ${LOGIN_URL}         ${BROWSER}
#     Input Text        ${EMAIL_FIELD}       ${EMAIL_1}
#     Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
#     Click Button      ${LOGIN_BUTTON}
#     Page Should Contain    MMP Portal

#     Go To    ${PO_URL}
#     Page Should Contain    Purchasement List
    
#     # Page Bidding List
#     Click Element   ${BIDDING_LIST_TAB}
#     Wait Until Element Is Visible   ${REVIEW_BUTTON}
    
#     # Approve Bidding List
#     Click Element    ${REVIEW_BUTTON}
#     Wait Until Element Is Visible    ${APPROVE_BUTTON}
#     Click Element    ${APPROVE_BUTTON}
#     Input Text       ${REMARKS}    ${REMARKS_APPROVE}
#     Click Element    ${APPROVE_VAL}
#     Click Element    ${VAL_BUTTON}

#     Wait Until Page Contains    Approved    timeout=30s
#     Close Browser

# Approval Bidding by Div. Head Purchasing
#     [Documentation]  This test case simulates the approval process of a bidding by Totok Suprapto. The test logs into the application, navigates to the bidding section, and performs the approval action.

#     Set Selenium Speed    value=0.5
#     Open Browser      ${LOGIN_URL}         ${BROWSER}
#     Input Text        ${EMAIL_FIELD}       ${EMAIL_2}
#     Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
#     Click Button      ${LOGIN_BUTTON}
#     Page Should Contain    MMP Portal

#     Go To    ${PO_URL}
#     Page Should Contain    Purchasement List
    
#     # Page Bidding List
#     Click Element   ${BIDDING_LIST_TAB}
#     Page Should Contain Element    ${REVIEW_BUTTON}
    
#     # Approve Bidding List
#     Click Element    ${REVIEW_BUTTON}
#     Page Should Contain    ${APPROVE_BUTTON}
#     Click Element    ${APPROVE_BUTTON}
#     Input Text       ${REMARKS}    OK
#     Click Element    ${APPROVE_VAL}
#     Click Element    ${VAL_BUTTON}

#     Close Browser

