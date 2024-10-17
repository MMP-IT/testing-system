*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

${LOGIN_URL}    http://devportal.mmproperty.com/login       
${PO_URL}       http://devportal.mmproperty.com/purchaseorder

${EMAIL}        akira.majori@mmproperty.com
${PASSWORD}     superFor

                
${LOGIN_BUTTON}         

# ! Config
${timeout}    30s
${browser}      Chrome

*** Test Cases ***

Receive Purchase Requisiton
    [Documentation]        This test case is used to receive purchase requisition by Akira Majori

    Set Selenium Speed    value=0.5s
    Open Browser      ${LOGIN_URL}         ${browser}
    Input Text        //input[@id='email']        ${EMAIL}
    Input Password    //input[@id='password']     ${PASSWORD}
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
    
# Process PR bidding
#     [Documentation]            This test case is used to process purchase requisition by Akira Majori

#     # Checklist item
#     Wait Until Page Contains    Item Selection
#     Click Element    //input[@class='form-check check-item-type' and @type='checkbox']
    
#     # Process
#     Click Button    //button[@id='btnProcessItem']
#     Wait Until Page Contains    //a[@href='#tab-rfq']

#     # Send RFQ
#     Click Element    //select[@id='is_direct']
#     Click Element    //option[@value='0']
#     Click Element    //input[@class='select2-search__field']
#     Click Element    //li[@data-select2-id="8561"]
#     Click Element    //input[@class='select2-search__field']
#     Click Element    //li[@data-select2-id="8562"]
#     Click Element    //input[@class="btn btn-primary" and @type="submit"]

Process PR Shopping list
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


