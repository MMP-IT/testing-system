*** Settings ***
Library    SeleniumLibrary
Library    DateTime  


*** Variables ***

# ! URL
${login_url}    http://devportal.mmproperty.com/login
${BROWSER}      CHROME

${fund_request_url}    http://devportal.mmproperty.com/fund-request

# ! user
${fr_finance}    rizki.maulida
${fr_user}    dimas.purwitasari
${general_pass}    superFor

# ! attachment document
${attachment_path}    D:/NIDA/MMP/testing-system/PR-PO/source/contoh.pdf

# ! config 
${timeout}    120s


*** Test Cases ***
Login
# ====== login proccess ======
    Set Selenium Speed    0.5 seconds
    Open Browser    ${login_url}    ${BROWSER}
    Set Window Size    1920    1080
    Input Text    //input[@id='email']    ${fr_finance}
    Input Text    //input[@id='password']    ${general_pass}
    Click Button    //button[@class='btn btn-primary btn-submit' and @type='submit']
# ====== end login proccess ======

Merge Supporting Document
    Go To    ${fund_request_url}
    Wait Until Element Is Visible    //a[@class='btn btn-sm btn-primary']    ${timeout}
    Click Element    //a[@class='btn btn-sm btn-primary']
    Wait Until Element Is Visible    //button[@class='btn btn-sm btn-primary']
    Click Button    //button[@class='btn btn-sm btn-primary']
    Click Button    //button[@class='swal2-confirm swal2-styled']
    Click Element    //a[@class='btn btn-danger']

Bundling Transaction
    Wait Until Page Contains    Ready Generate    ${timeout}
    Scroll Element Into View     //td[@class='select-checkbox sorting_1']
    Click Element    //td[@class='select-checkbox sorting_1']
    Click Button    //button[@id="btnSubmit"]
    Wait Until Page Contains Element    //button[@class='swal2-confirm swal2-styled']
    Click Button    //button[@class='swal2-confirm swal2-styled']
    Wait Until Page Contains Element    //button[@class='swal2-confirm swal2-styled']
    Click Button    //button[@class='swal2-confirm swal2-styled']

Export to Excel
    Wait Until Page Contains Element    //a[@id='progress-tab']
    Click Element    //a[@id='progress-tab']
    Wait Until Page Contains Element    //button[@class='btn btn-sm btn-primary btnCollapse']
    Click Button    //button[@class='btn btn-sm btn-primary btnCollapse']
    Click Button    //button[@id='btnExcel']
    Click Button    //button[@class='swal2-confirm swal2-styled']

Download Attachment
    Wait Until Page Contains Element    //button[@class='btn btn-sm btn-primary btnCollapse']
    Click Button    //button[@class='btn btn-sm btn-primary btnCollapse']
    Scroll Element Into View    //button[@id='btnAttachment']
    Click Button    //button[@id='btnAttachment']
    Switch Window    MAIN
    Wait Until Page Contains Element    //button[@class='swal2-confirm swal2-styled']

Upload Supporting Document
    Reload Page
    Wait Until Page Contains Element    //a[@id='progress-tab']
    Click Element    //a[@id='progress-tab']
    Wait Until Page Contains Element    //button[@class='btn btn-sm btn-primary btnCollapse']
    Click Button    //button[@class='btn btn-sm btn-primary btnCollapse']
    Click Button    //button[@id='btnSupportingDocument']

    # supporting document
    Choose File    //input[@name='supporting_document']    ${attachment_path}

    Click Button    //button[@id='btnUploadSupportingDocument']
    Click Button    //button[@class='swal2-confirm swal2-styled']

Submit to Kepple
    Wait Until Page Contains Element    //button[@class='btn btn-sm btn-primary btnCollapse']
    Click Button    //button[@class='btn btn-sm btn-primary btnCollapse']
    Wait Until Page Contains Element    //button[@id='btnSubmitToKeppel']
    Click Button    //button[@id='btnSubmitToKeppel']
    Wait Until Page Contains Element    //button[@class='swal2-confirm swal2-styled']
    Click Button    //button[@class='swal2-confirm swal2-styled']

Complete Transaction
    Reload Page
    Wait Until Page Contains Element    //a[@id='progress-tab']
    Click Element    //a[@id='progress-tab']
    Wait Until Page Contains Element    //button[@class='btn btn-sm btn-primary btnCollapse']
    Click Button    //button[@class='btn btn-sm btn-primary btnCollapse']
    Scroll Element Into View    //button[@id='btnDone']
    Wait Until Page Contains Element    //button[@id='btnDone']
    Click Button    //button[@id='btnDone']
    Click Button    //button[@class='swal2-confirm swal2-styled']
    Wait Until Page Contains Element    //button[@class='swal2-confirm swal2-styled']
    Click Button    //button[@class='swal2-confirm swal2-styled']

Check History
    Wait Until Page Contains Element    //a[@id='history-tab']
    Click Element    //a[@id='history-tab']
    Close Browser