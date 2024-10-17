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

${VIEW_BUTTON}         //a[@id='btn-purchase-approval-view']
${REVIEW_BUTTON}       //a[@id='btn-purchase-approval']

${APPROVE_BUTTON}      //button[@id='isapproval']
${REJECT_BUTTON}       //button[contains(@class, 'btn') and contains(@class, 'btn-pr-reject')]
${REMARKS}             //textarea[@id='approval-remarks']
${APPROVE_VAL}         //button[@id='btn-ok']
${REJECT_VAL}          //button[@class='btn btn-danger']
${VALIDASI}            //button[@class='swal2-confirm swal2-styled']

${ITEM_APPROVED}       //input[@type='number' and @name='approved_qty[]']
${REJECT_REASON}       //span[@id='select2-reject_reason-container']
${REASON}              //li[contains(@class, 'select2-results__option') and text()='Wrong entry']  

${ITEM}                1
${REMARKS_INPUT}       ok


${BROWSER}      Chrome

*** Test Cases ***
Approval Purchase Requisition
    [Documentation]    This test case simulates the approval process of a purchase requisition by a Superior user. The test logs into the application, navigates to the purchase requisition section, and performs the approval action.
    
    Set Selenium Speed    value=0.3
    Open Browser      ${LOGIN_URL}         ${BROWSER}
    Input Text        ${EMAIL_FIELD}       ${EMAIL}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button      ${LOGIN_BUTTON}
    Page Should Contain    MMP Portal

    Go To    ${PR_URL}
    Page Should Contain    Purchasement List

    Wait Until Page Contains Element   ${REVIEW_BUTTON}    timeout=30 seconds
    Click Element   ${REVIEW_BUTTON}
    
    Wait Until Element Is Enabled    ${APPROVE_BUTTON}    timeout=30 seconds
    Page Should Contain    Purchase Requisition Approval

    Wait Until Page Contains Element    ${ITEM_APPROVED}
    Input Text    ${ITEM_APPROVED}    ${ITEM}
    Click Button    ${APPROVE_BUTTON}

    Wait Until Page Contains    Approval Remarks
    Input Text    ${REMARKS}    ${REMARKS_INPUT}
    Click Button    ${APPROVE_VAL}
    Click Button    ${VALIDASI}

    Wait Until Page Contains    Success   
    Location Should Be    ${PR_URL}
    Close Browser

Approval Reject Purchase Requisition
    [Documentation]    This test case simulates the rejection approval process of a purchase requisition by a Superior user. The test logs into the application, navigates to the purchase requisition section, and performs the approval action.
    
    Set Selenium Speed    value=0.5
    Open Browser      ${LOGIN_URL}         ${BROWSER}
    Input Text        ${EMAIL_FIELD}       ${EMAIL}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button      ${LOGIN_BUTTON}
    Page Should Contain    MMP Portal

    Go To    ${PR_URL}
    Page Should Contain    Purchasement List

    Wait Until Page Contains Element   ${REVIEW_BUTTON}
    Click Element   ${REVIEW_BUTTON}

    Page Should Contain    Purchase Requisition Approval
    Click Button    ${REJECT_BUTTON}

    Wait Until Page Contains    Reject Reason
    Click Element    ${REJECT_REASON}    
    Click Element    ${REASON}
    Click Button     ${REJECT_VAL}
    Click Button     ${VALIDASI}

    Wait Until Page Contains    Purchasement List   
    Location Should Be    ${PR_URL}
    Close Browser
