*** Settings ***
Library    SeleniumLibrary


*** Variables ***

# ! URL
${login_url}    http://devportal.mmproperty.com/login
${BROWSER}      chrome

${purchase_requisition_url}    http://devportal.mmproperty.com/purchaserequisition

# ! requester user
${pr_requester_email}    daniel.fernando
${pr_request_pass}    superFor
${approval_pr_user}    arief.wibowo

# ! Purchase Requisition Entry Form Value
${department}    IT
${location}    intirub
${attachment_path}    D:/Intern/MMP/work/robotframework/testing-system/PR-PO/source/contoh.pdf
${desc}    test input description
${item}    laptop hp probook
${order_qty}    2
${remark}    ini test remark

# Entry Approval
${item_approve}    1
${REMARKS_INPUT}       ok

# ! config 
${timeout}    30s



*** Test Cases ***
Membuat Purchase Requisition
    Set Selenium Speed    0.3s
# ====== login proccess ======
    Open Browser    ${login_url}    Chrome
    Set Window Size    1920    1080
    Wait Until Element Is Visible    //div[@class='container']
    Input Text    //input[@id='email']    ${pr_requester_email}
    Input Text    //input[@id='password']    ${pr_request_pass}
    Click Button    //button[@class='btn btn-primary btn-submit' and @type='submit']

# ====== end login proccess ======

# ====== create purchase requisition ======
    Go To    ${purchase_requisition_url}
    Page Should Contain    Create Purchase Requisition (PR)
    Click Button    //button[@class='btn btn-primary' and @type='button']
    Wait Until Element Is Visible    //div[@class='modal-content']    ${timeout}


    # ! filling form
    # Request No
    Wait Until Element Is Visible  //span[@id='select2-trx_type-container']    ${timeout}
    Click Element    //span[@id='select2-trx_type-container']
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']

    # Entity
    Wait Until Element Is Visible    //span[@id='select2-entity_cd_pr-container']    ${timeout}
    Click Element    //span[@id='select2-entity_cd_pr-container']
    Wait Until Element Is Visible    //input[@class='select2-search__field']    ${timeout}
    Click Element    //input[@class='select2-search__field']  
    Click Element    //li[contains(@class, 'select2-results__option')][1] 


    # Division
    Wait Until Element Is Visible    //span[@id='select2-div_cd-container']    ${timeout}
    Click Element    //span[@id='select2-div_cd-container']
    Wait Until Element Is Visible    //ul[@class='select2-results__options']    ${timeout}
    Click Element    //li[contains(@class, 'select2-results__option')][1]

    # Department
    Wait Until Element Is Visible    //span[@id='select2-dept_cd-container']    ${timeout}
    Click Element    //span[@id='select2-dept_cd-container']
    Input Text    //input[@class='select2-search__field']    ${department}

    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']


    # Priority
    Wait Until Element Is Visible    //span[@id='select2-priority-container']    ${timeout}
    Click Element    //span[@id='select2-priority-container']
    Wait Until Element Is Visible    //span[@class='select2-dropdown select2-dropdown--below']    ${timeout}
    Click Element    //li[contains(@id, 'select2-priority-result')][1]


    # Working Activity
    Wait Until Element Is Visible    //span[@id='select2-working_activity_pr-container']    ${timeout}
    Click Element    //span[@id='select2-working_activity_pr-container']
    Wait Until Element Is Visible    //span[@class='select2-dropdown select2-dropdown--below']    ${timeout}
    Click Element    //li[contains(@class, 'select2-results__option')][1]


    # location
    Wait Until Element Is Visible    //span[@id='select2-location-container']    ${timeout}
    Click Element    //span[@id='select2-location-container']
    Input Text    //input[@class='select2-search__field']    ${location}
    Wait Until Element Is Visible    //span[@class='select2-dropdown select2-dropdown--below']    ${timeout}
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']   


    # ship to
    Wait Until Element Is Visible    //span[@id='select2-ship-to-container']    ${timeout}
    Click Element    //span[@id='select2-ship-to-container']
    Wait Until Element Is Visible    //li[@class='select2-results__option select2-results__option--highlighted']    ${timeout}
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']

    
    # supporting document
    Choose File    //input[@name='pr_attachment[]']    ${attachment_path}


    # description
    Input Text    //textarea[@name='remark']    ${desc}


    # Choose Item
    Click Element    //span[@id='select2-purchase-requisition-ajax1-container']
    Input Text    //input[@class='select2-search__field']    ${item}
    Wait Until Element Is Visible    //span[@class='select2-dropdown select2-dropdown--below']    ${timeout}
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']

    # Order Qty
    Input Text    //input[@name='pr_order_qty[]']    ${order_qty}

    # remark
    Wait Until Element Is Visible    //textarea[@name='pr_remark[]']    ${timeout}
    Input Text    //textarea[@name='pr_remark[]']    ${remark}
    Click Element    //input[@name='pr_order_qty[]']

Save Purchase Requisition Entry
    # ! save pr
    Click Button    //button[@id='btn-submit-requisition' and @type='submit']
    Location Should Be    http://devportal.mmproperty.com/purchaserequisition

Posting Purchase Requisition Entry With Save
    # ! posting pr
    Wait Until Element Is Visible    //a[@class='edit btn btn-danger btn-sm']
    Click Element    //a[@class='edit btn btn-danger btn-sm']
    Scroll Element Into View    //button[@class='btn btn-primary btn-sm']
    Click Button    //button[@class='btn btn-primary btn-sm' and @type='submit']
    

    Click Button    //button[@class='swal2-confirm swal2-styled']


# Direct Posting Purchase Requisition Entry 
#     Click Button    //button[@id='btn-submit-requisition' and @class='btn btn-primary']
# ====== end create purchase requisition ======
    Close Browser

Approval Purchase Requisition
    [Documentation]    This test case simulates the approval process of a purchase requisition by a Superior user. The test logs into the application, navigates to the purchase requisition section, and performs the approval action.
    
    Set Selenium Speed    value=0.5
    Open Browser      ${LOGIN_URL}         ${BROWSER}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${approval_pr_user}
    Input Password    //input[@id='password']     ${pr_request_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    http://devportal.mmproperty.com/purchaserequisition
    Page Should Contain    Purchasement List

    # Click Review Button on Record
    Wait Until Page Contains Element   //a[@id='btn-purchase-approval']   timeout=30 seconds
    Click Element   //a[@id='btn-purchase-approval']
    
    # Approve Purchase Requisition
    Wait Until Element Is Visible    //button[@id='isapproval']    timeout=30 seconds
    Page Should Contain    Purchase Requisition Approval

    # Input Item Approve
    Wait Until Page Contains Element    //input[@type='number' and @name='approved_qty[]']
    Input Text    //input[@type='number' and @name='approved_qty[]']    ${item_approve}  
    Wait Until Element Is Visible    //button[@id='isapproval' and @type='submit']
    Click Button    //button[@id='isapproval' and @type='submit']     

    Wait Until Page Contains    Approval Remarks
    Input Text    //textarea[@id='approval-remarks']    ${REMARKS_INPUT}
    Click Button   //button[@id='btn-ok']
    Click Button   //button[@class='swal2-confirm swal2-styled']

    Wait Until Page Contains    Success   
    Location Should Be    http://devportal.mmproperty.com/purchaserequisition
    Close Browser