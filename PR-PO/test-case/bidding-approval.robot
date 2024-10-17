*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

${LOGIN_URL}    http://devportal.mmproperty.com/login       
${PO_URL}       http://devportal.mmproperty.com/purchaseorder

${EMAIL_1}      ricca.sumarni@mmproperty.com
${EMAIL_2}      totok.suprapto@mmproperty.com
${EMAIL_3}      carlina.prasetya@mmproperty.com
${PASSWORD}     superFor

${EMAIL_FIELD}         //input[@id='email']                        
${PASSWORD_FIELD}      //input[@id='password']                     
${LOGIN_BUTTON}        //button[@class='btn btn-primary btn-submit' and @type='submit']  

${BIDDING_LIST_TAB}    //a[@href='#tab3']

${REVIEW_BUTTON}       //a[@class='edit btn btn-info btn-sm']
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

Approve Bidding by Dep. Head Purchasing
    [Documentation]    This test case simulates the approval process of a bidding by Ricca Sumarni. The test logs into the application, navigates to the bidding section, and performs the approval action.
    Set Selenium Speed    value=0.5
    Open Browser      ${LOGIN_URL}         ${BROWSER}
    Input Text        //input[@id='email']       ${EMAIL_1}
    Input Password    //input[@id='password']    ${PASSWORD}
    Click Button      ${LOGIN_BUTTON}
    Page Should Contain    MMP Portal

    Go To    ${PO_URL}
    Page Should Contain    Purchasement List
    
    # Page Bidding List
    Click Element   //a[@href='#tab3']
    
    # Approve Bidding List
    Wait Until Element Is Visible    //a[@class='edit btn btn-info btn-sm']
    Click Element    //a[@class='edit btn btn-info btn-sm']
    Scroll Element Into View     //button[@class='bid-approval']
    Click Element      //button[@class='bid-approval']
    Input Text       //textarea[@id='approval-remarks']    OK
    Click Element    //button[@id='btn-ok']

    Click Button   //button[@class='swal2-confirm btn btn-success']
    Close Browser

Approval Bidding by Div. Head Purchasing
    [Documentation]  This test case simulates the approval process of a bidding by Totok Suprapto. The test logs into the application, navigates to the bidding section, and performs the approval action.
    Set Selenium Speed    0.5s
    Open Browser      ${LOGIN_URL}         ${BROWSER}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']       ${EMAIL_2}
    Input Password    //input[@id='password']    ${PASSWORD}
    Click Button      ${LOGIN_BUTTON}
    Page Should Contain    MMP Portal

    Go To    ${PO_URL}
    Page Should Contain    Purchasement List
    
    # Page Bidding List
    Click Element   //a[@href='#tab3']
    
    # Approve Bidding List
    Wait Until Element Is Visible    //a[@class='edit btn btn-info btn-sm']
    Click Element    //a[@class='edit btn btn-info btn-sm']
    Scroll Element Into View     //button[@class='bid-approval']
    Click Element      //button[@class='bid-approval']
    Input Text       //textarea[@id='approval-remarks']    OK
    Click Element    //button[@id='btn-ok']

    Click Button   //button[@class='swal2-confirm btn btn-success']
    Close Browser


Approval Bidding by Budget
    
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    1920    1080
    Set Selenium Speed    0.5s
    Input Text    //input[@id='email']    ${EMAIL_3}    
    Input Text    //input[@id='password']    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}

    Go To    ${PO_URL}
    Page Should Contain    Purchasement List

    # Page Bidding List
    Click Element   //a[@href='#tab3']

    # Approve Bidding List
    Wait Until Element Is Visible    //a[@class='edit btn btn-info btn-sm']
    Click Element    //a[@class='edit btn btn-info btn-sm']
    Scroll Element Into View     //button[@class='bid-approval']
    Click Element      //button[@class='bid-approval']
    Input Text       //textarea[@id='approval-remarks']    OK
    Click Element    //button[@id='btn-ok']
    Click Button   //button[@class='swal2-confirm btn btn-success']
    Close Browser