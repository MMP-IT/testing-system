*** Settings ***
Library    SeleniumLibrary
Library    DateTime  


*** Variables ***

# ! URL
${login_url}    http://devportal.mmproperty.com/login
${BROWSER}      chrome

${purchase_requisition_url}    http://devportal.mmproperty.com/purchaserequisition
${purchas_order_url}    http://devportal.mmproperty.com/purchaseorder

# ! requester user
${pr_requester_email}    daniel.fernando
${approval_pr_user}    arief.wibowo
${purchasing}    akira.majori
${purchasing_manager}    ricca.sumarni
${purchasing_head}    totok.suprapto
${budget_control}    carlina.prasetya
${general_pass}    superFor

# ! Purchase Requisition Entry Form Value
${department}    IT
${location}    intirub
# ${attachment_path}    D:/Intern/MMP/work/robotframework/testing-system/PR-PO/source/contoh.pdf
${attachment_path}    D:/NIDA/MMP/testing-system/PR-PO/source/contoh.pdf
${item}    Mouse Logitech MX Anywhere 2S
${order_qty}    1

# ! GRN
${other_pic}    Ricca Sumarni

# !Entry Approval
${item_approve}    1
${REMARKS_INPUT}    OK

# ! Edit Draft PO
${available_value}    1

# ! config 
${timeout}    120s



*** Test Cases ***
Membuat Purchase Requisition
# ====== login proccess ======
    Set Selenium Speed    0.4 seconds
    Open Browser    ${login_url}    Chrome
    Set Window Size    1920    1080
    Wait Until Element Is Visible    //div[@class='container']    ${timeout}
    Input Text    //input[@id='email']    ${pr_requester_email}
    Input Text    //input[@id='password']    ${general_pass}
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
    Sleep    2s
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


    Wait Until Element Is Visible    //li[@class='select2-results__option select2-results__option--highlighted']
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
    Sleep    3s
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']   


    # ship to
    Wait Until Element Is Visible    //span[@id='select2-ship-to-container']    ${timeout}
    Click Element    //span[@id='select2-ship-to-container']
    Wait Until Element Is Visible    //li[@class='select2-results__option select2-results__option--highlighted']    ${timeout}
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']

    
    # supporting document
    Choose File    //input[@name='pr_attachment[]']    ${attachment_path}

    ${desc_and_remark}    Get Current Date    local    result_format=timestamp
    # description
    Input Text    //textarea[@name='remark']    ${desc_and_remark}


    # Choose Item
    Click Element    //span[@id='select2-purchase-requisition-ajax1-container']
    Input Text    //input[@class='select2-search__field']    ${item}
    Wait Until Element Is Visible    //span[@class='select2-dropdown select2-dropdown--below']    ${timeout}
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']

    # Order Qty
    Input Text    //input[@name='pr_order_qty[]']    ${order_qty}

    # remark
    Wait Until Element Is Visible    //textarea[@name='pr_remark[]']    ${timeout}

    Input Text    //textarea[@name='pr_remark[]']    ${desc_and_remark}
    Click Element    //input[@name='pr_order_qty[]']

Save Purchase Requisition Entry
    # ! save pr
    Click Button    //button[@id='btn-submit-requisition' and @type='submit']
    Location Should Be    http://devportal.mmproperty.com/purchaserequisition

Posting Purchase Requisition Entry With Save
    # ! posting pr
    Wait Until Element Is Visible    //a[@class='edit btn btn-danger btn-sm']    ${timeout}
    Click Element    //a[@class='edit btn btn-danger btn-sm']
    Scroll Element Into View    //button[@class='btn btn-primary btn-sm']
    Click Button    //button[@class='btn btn-primary btn-sm' and @type='submit']
    

    Click Button    //button[@class='swal2-confirm swal2-styled']

    Close Browser


# # Direct Posting Purchase Requisition Entry 
# #     Click Button    //button[@id='btn-submit-requisition' and @class='btn btn-primary']
# # ====== end create purchase requisition ======
#     Close Browser

Approval Purchase Requisition
    [Documentation]    This test case simulates the approval process of a purchase requisition by a Superior user. The test logs into the application, navigates to the purchase requisition section, and performs the approval action.
    
    Set Selenium Speed    value=0.5
    Open Browser      ${LOGIN_URL}         ${BROWSER}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${approval_pr_user}
    Input Password    //input[@id='password']     ${general_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    http://devportal.mmproperty.com/purchaserequisition
    Page Should Contain    Purchasement List

    # Click Review Button on Record
    Wait Until Page Contains Element   //a[@id='btn-purchase-approval']   ${timeout}
    Click Element   //a[@id='btn-purchase-approval']
    
    # Approve Purchase Requisition
    Wait Until Element Is Visible    //button[@id='isapproval']    ${timeout}
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

Receive Purchase Requisiton
    [Documentation]        This test case is used to receive purchase requisition by Akira Majori
    Set Selenium Speed    0.5s
    Open Browser      ${LOGIN_URL}         ${browser}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${purchasing}
    Input Password    //input[@id='password']    ${general_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    ${purchas_order_url}
    Reload Page
    Sleep    5s
    Reload Page

    Page Should Contain    Purchasement List

    Wait Until Element Is Visible    //a[@class="edit btn btn-warning btn-sm"]    ${timeout}
    Click Element    //a[@class="edit btn btn-warning btn-sm"]
    
    Scroll Element Into View    //button[@id="btnConfirmPR"]
    Click Button    //button[@id="btnConfirmPR"]


    Wait Until Element Is Visible    //button[@class='swal2-confirm swal2-styled']    ${timeout}
    Click Button    //button[@class="swal2-confirm swal2-styled"]

    Close Browser

Send RFQ - Shopping List
    Set Selenium Speed    0.5s
    Open Browser      ${LOGIN_URL}         ${browser}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${purchasing}
    Input Password    //input[@id='password']    ${general_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    ${purchas_order_url}

    Wait Until Element Is Visible    //a[contains(@class, 'btn-primary')]    ${timeout}
    Click Element   //a[contains(@class, 'btn-primary')]

    # !!
    # Checklist item
    Wait Until Element Is Visible    //input[@id='check1']    ${timeout}
    Scroll Element Into View    //input[@id='check1']
    Click Element    //input[@id='check1']
    

    # Process
    Scroll Element Into View    //button[@id='btnProcessItem']
    Click Button    //button[@id='btnProcessItem']

    Sleep    5 seconds

    Click Element    //a[@href='#tab-rfq']

    Scroll Element Into View    //input[@style='width: 100%']
    Click Element    //input[@style='width: 100%']

    Reload Page



Edit Draft Purchase Order
    Set Selenium Speed    0.5s
    sleep    5s
    Reload Page
    Wait Until Element Is Visible        //a[@href='#tab-supplier-contract']    ${timeout}
    Click Element    //a[@href='#tab-supplier-contract']

    Click Button    //button[@class='btn btn-warning btnEditDraftPO']

    # Edit Qty
    Wait Until Element Is Visible    //input[@name='alloc_qty[]']    ${timeout}
    Input Text    //input[@name='alloc_qty[]']    ${available_value}

    Click Button    //button[@id='btnSaveEditDraftPO']

Generate Purchase Order
    Set Selenium Speed    0.5s
    Reload Page   
    Wait Until Element Is Visible        //a[@href='#tab-supplier-contract']    ${timeout}
    Click Element    //a[@href='#tab-supplier-contract']

    Scroll Element Into View    //button[@class='btn btn-secondary btnSubmitDraftPO']
    Click Button    //button[@class='btn btn-secondary btnSubmitDraftPO']

    Wait Until Element Is Visible    //div[@class='swal2-popup swal2-modal swal2-show']    ${timeout}
    Click Button    //button[@class='swal2-confirm swal2-styled']

    Close Browser

Draft Purchase Order Approval By Mgr Purchasing
    Set Selenium Speed    0.5s
    Open Browser      ${LOGIN_URL}         ${browser}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${purchasing_manager}
    Input Password    //input[@id='password']    ${general_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    ${purchas_order_url}
    
    Wait Until Element Is Visible    //a[@href='#tab4']
    Click Element    //a[@href='#tab4']


    Wait Until Element Is Visible    //a[@class='edit btn btn-primary btn-sm btnDraftPo']    ${timeout}
    Click Element    //a[@class='edit btn btn-primary btn-sm btnDraftPo']
    

    Scroll Element Into View    //a[@class='btn btn-success']
    Click Element    //a[@class='btn btn-success']

    Scroll Element Into View    //button[@class='bid-approval']
    Click Button    //button[@class='bid-approval']

    Wait Until Element Is Visible    //textarea[@id='approval-remarks']
    Input Text    //textarea[@id='approval-remarks']    ${REMARKS_INPUT}

    Wait Until Element Is Visible    //button[@class='btn btn-primary']
    Click Button    //button[@class='btn btn-primary']


    # Wait Until Element Is Visible    //div[@class='swal2-popup swal2-modal swal2-show']
    Click Button    //button[@class='swal2-confirm btn btn-success']

    Wait Until Element Is Visible    //div[@class='swal2-popup swal2-modal swal2-show']    ${timeout}
    Click Button    //button[@class='swal2-confirm swal2-styled']

    Close Browser


Draft Purchase Order Approval By Head Purchasing
    Set Selenium Speed    0.5s
    Open Browser      ${LOGIN_URL}         ${browser}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${purchasing_head}
    Input Password    //input[@id='password']    ${general_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    ${purchas_order_url}
    
    Wait Until Element Is Visible    //a[@href='#tab4']    ${timeout}
    Click Element    //a[@href='#tab4']


    Wait Until Element Is Visible    //a[@class='edit btn btn-primary btn-sm btnDraftPo']    ${timeout}
    Click Element    //a[@class='edit btn btn-primary btn-sm btnDraftPo']
    

    Scroll Element Into View    //a[@class='btn btn-success']    
    Click Element    //a[@class='btn btn-success']

    Scroll Element Into View    //button[@class='bid-approval']
    Click Button    //button[@class='bid-approval']

    Wait Until Element Is Visible    //textarea[@id='approval-remarks']    ${timeout}
    Input Text    //textarea[@id='approval-remarks']    ${REMARKS_INPUT}

    Wait Until Element Is Visible    //button[@class='btn btn-primary']    ${timeout}
    Click Button    //button[@class='btn btn-primary']

    Click Button    //button[@class='swal2-confirm btn btn-success']

    Wait Until Element Is Visible    //div[@class='swal2-popup swal2-modal swal2-show']    ${timeout}
    Click Button    //button[@class='swal2-confirm swal2-styled']

    Close Browser



Draft Purchase Order Approval By Budget
    Set Selenium Speed    0.5s
    Open Browser      ${LOGIN_URL}         ${browser}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${budget_control}
    Input Password    //input[@id='password']    ${general_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    ${purchas_order_url}
    
    Wait Until Element Is Visible    //a[@href='#tab4']    ${timeout}
    Click Element    //a[@href='#tab4']


    Wait Until Element Is Visible    //a[@class='edit btn btn-primary btn-sm btnDraftPo']    ${timeout}
    Click Element    //a[@class='edit btn btn-primary btn-sm btnDraftPo']
    

    Scroll Element Into View    //a[@class='btn btn-success']
    Click Element    //a[@class='btn btn-success']

    Scroll Element Into View    //button[@class='bid-approval']
    Click Button    //button[@class='bid-approval']

    Wait Until Element Is Visible    //textarea[@id='approval-remarks']    ${timeout}
    Input Text    //textarea[@id='approval-remarks']    ${REMARKS_INPUT}

    Wait Until Element Is Visible    //button[@class='btn btn-primary']    ${timeout}
    Click Button    //button[@class='btn btn-primary']

    # Wait Until Element Is Visible    //div[@class='swal2-popup swal2-modal swal2-show']
    Click Button    //button[@class='swal2-confirm btn btn-success']

    Wait Until Element Is Visible    //div[@class='swal2-popup swal2-modal swal2-show']    ${timeout}
    Click Button    //button[@class='swal2-confirm swal2-styled']

    Close Browser

Posting Purchase Order 
    Set Selenium Speed    0.5s
    Open Browser      ${LOGIN_URL}         ${browser}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${purchasing}
    Input Password    //input[@id='password']    ${general_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    ${purchas_order_url}

    
    Wait Until Element Is Visible    //a[@href='#tab1']    ${timeout}
    Click Element    //a[@href='#tab1']

    Wait Until Element Is Visible    //a[@class='edit btn btn-warning btn-sm']    ${timeout}
    Click Element    //a[@class='edit btn btn-warning btn-sm']

    Scroll Element Into View   //a[@href='#tab-po']
    Click Element    //a[@href='#tab-po']

    Scroll Element Into View    (//a[contains(@href, '#tab-rg')])
    Click Element    (//a[contains(@href, '#tab-rg')])

    Scroll Element Into View   //input[@class='check_generate_po']
    Click Element   //input[@class='check_generate_po']

    # Scroll Element Into View    (//input[contains(@name, 'expected_delivery')])

    Execute Javascript    window.scrollBy(500, 0)  # Scroll 500 pixels to the right{y_location})
    ${current_date}    Get Current Date    result_format=%Y-%m-%d
    ${expected_date}   Add Time To Date    ${current_date}    5d    result_format=%Y%m%d

    Input Text    //input[@name='expected_delivery[]']    ${expected_date}

    Scroll Element Into View    //button[@class='btn btn-primary pull-right']
    Click Button    //button[@class='btn btn-primary pull-right']

    Wait Until Element Is Visible    //button[@class='swal2-confirm swal2-styled']
    Click Button    //button[@class='swal2-confirm swal2-styled']


Approval PO By Head Purchasing
    Set Selenium Speed    0.5s
    Open Browser      ${LOGIN_URL}         ${browser}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${purchasing_head}
    Input Password    //input[@id='password']    ${general_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    ${purchas_order_url}

    Wait Until Element Is Visible    //a[@href='#tab2']    ${timeout}
    Click Element    //a[@href='#tab2']


    Click Element    //a[@class='edit btn btn-warning btn-sm']
    

    Scroll Element Into View    //button[@class='btn-purchase-order-approve2']
    Click Button    //button[@class='btn-purchase-order-approve2']

    Wait Until Element Is Visible    //textarea[@name='approval-remarks']    ${timeout}
    Input Text    //textarea[@name='approval-remarks']    ${REMARKS_INPUT}

    Click Button    //button[@id='btn-ok']

    Click Button    //button[@class='swal2-confirm swal2-styled']
    
    Close Browser


Create GRN
    Set Selenium Speed    0.5s
    Open Browser      ${LOGIN_URL}         ${browser}
    Set Window Size    1920    1080
    Input Text        //input[@id='email']        ${pr_requester_email}
    Input Password    //input[@id='password']    ${general_pass}
    Click Button      //button[@class='btn btn-primary btn-submit' and @type='submit']
    Page Should Contain    MMP Portal

    Go To    ${purchase_requisition_url}

    Wait Until Element Is Visible    //a[@class='edit btn btn-success btn-sm']    ${timeout}
    Click Element    //a[@class='edit btn btn-success btn-sm']

    Scroll Element Into View    //a[@href='#tab-receiving-entry']
    Click Element    //a[@href='#tab-receiving-entry']

    Choose File    //input[@id='attachment_grn_entry']    ${attachment_path}

    Scroll Element Into View    //span[contains(@id, 'select2-pic_name-')]

    Click Element    //span[contains(@id, 'select2-pic_name-')]

    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']


    ${current_date}    Get Current Date    result_format=%Y-%m-%d
    ${guarantee}   Add Time To Date    ${current_date}    7d    result_format=%d%m%Y


    Scroll Element Into View    //input[@type='date' and @name='warranty[]']

    Input Text    //input[@type='date' and @name='warranty[]']    ${guarantee}

    Input Text    //input[@id='receipt_qty']    ${order_qty}

    Click Button    //button[@id='temporary-grn-user']