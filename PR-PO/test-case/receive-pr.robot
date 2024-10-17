*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

${LOGIN_URL}    http://devportal.mmproperty.com/login       
${PO_URL}       http://devportal.mmproperty.com/purchaseorder

${EMAIL}        akira.majori@mmproperty.com
${PASSWORD}     superFor

${EMAIL_FIELD}         //input[@id='email']                        
${PASSWORD_FIELD}      //input[@id='password']                     
${LOGIN_BUTTON}        //button[@class='btn btn-primary btn-submit' and @type='submit']  

${BROWSER}      Chrome

*** Test Cases ***

Receive Purchase Requisiton
    [Documentation]        This test case is used to receive purchase requisition by Akira Majori

    Set Selenium Speed    value=0.5
    Open Browser      ${LOGIN_URL}         ${BROWSER}
    Input Text        ${EMAIL_FIELD}       ${EMAIL}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button      ${LOGIN_BUTTON}
    Page Should Contain    MMP Portal

    Go To    ${PO_URL}
    Page Should Contain    Purchasement List

    Wait Until Element Is Visible    //a[@class="edit btn btn-warning btn-sm"]
    Click Element    /a[@class="edit btn btn-warning btn-sm"]
    
    Wait Until Page Contains    Receive PR
    Click Button    //button[@id="btnConfirmPR"]
    Click Button    //button[@class="swal2-confirm swal2-styled"]

    Wait Until Page Contains    Succesful
    
Process PR
    [Documentation]            This test case is used to process purchase requisition by Akira Majori

    # Checklist item
    Wait Until Page Contains    Item Selection
    Click Element    //input[@class='form-check check-item-type' and @type='checkbox']
    
    # Process
    Click Button    //button[@id='btnProcessItem']
    Wait Until Page Contains    //a[@href='#tab-rfq']

    # Send RFQ
    Click Element    //select[@id='is_direct']
    Click Element    //option[@value='0']
    Click Element    //input[@class='select2-search__field']
    Click Element    //li[@data-select2-id="8561"]
    Click Element    //input[@class='select2-search__field']
    Click Element    //li[@data-select2-id="8562"]
    Click Element    //input[@class="btn btn-primary" and @type="submit"]


