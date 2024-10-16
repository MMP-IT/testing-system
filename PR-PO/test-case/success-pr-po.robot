*** Settings ***
Library    SeleniumLibrary


*** Variables ***

# ! login URL
${login_url}    http://devportal.mmproperty.com/login

# ! purchase requisition URL
${purchase_requisition_url}    http://devportal.mmproperty.com/purchaserequisition

# ! requester user
${pr_requester_email}    daniel.fernando
${pr_request_pass}    superFor


# ! config 
${timeout}    30s



# !===================================== login element =================================

${email_field}    //input[@id='email']
${password_field}    //input[@id='password']
${login_button}    //button[@class='btn btn-primary btn-submit' and @type='submit']

# !===================================== end login element =================================

# !===================================== create purchase requisition element =================================


${create_pr_button}    //button[@class='btn btn-primary' and @type='button']
${modal_create_pr_form}    //div[@class='modal-content']


# !===================================== end create purchase requisition element =================================


*** Test Cases ***
Membuat Purchase Requisition
    Set Selenium Speed    300ms
# ====== login proccess ======
    Open Browser    ${login_url}    Chrome
    Set Window Size    1920    1080
    Wait Until Element Is Visible    //div[@class='container']
    Input Text    ${email_field}    ${pr_requester_email}
    Input Text    ${password_field}    ${pr_request_pass}
    Click Button    ${login_button}

# ====== end login proccess ======

# ====== create purchase requisition ======
    Go To    ${purchase_requisition_url}
    Page Should Contain    Create Purchase Requisition (PR)
    Click Button    ${create_pr_button}
    Wait Until Element Is Visible    ${modal_create_pr_form}    ${timeout}


    # ! filling form
    # Request No
    Wait Until Element Is Visible  //span[@id='select2-trx_type-container']    ${timeout}
    Click Element    //span[@id='select2-trx_type-container']
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']

    # Entity
    Wait Until Element Is Visible    //span[@id='select2-entity_cd_pr-container']
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
    Input Text    //input[@class='select2-search__field']    IT

    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']


    # Priority
    Wait Until Element Is Visible    //span[@id='select2-priority-container']
    Click Element    //span[@id='select2-priority-container']
    Wait Until Element Is Visible    //span[@class='select2-dropdown select2-dropdown--below']
    Click Element    //li[contains(@id, 'select2-priority-result')][1]


    # Working Activity
    Wait Until Element Is Visible    //span[@id='select2-working_activity_pr-container']    ${timeout}
    Click Element    //span[@id='select2-working_activity_pr-container']
    Wait Until Element Is Visible    //span[@class='select2-dropdown select2-dropdown--below']
    Click Element    //li[contains(@class, 'select2-results__option')][1]


    # location
    Wait Until Element Is Visible    //span[@id='select2-location-container']    ${timeout}
    Click Element    //span[@id='select2-location-container']
    Input Text    //input[@class='select2-search__field']    intirub
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']


    # ship to
    Wait Until Element Is Visible    //span[@id='select2-ship-to-container']
    Click Element    //span[@id='select2-ship-to-container']
    Wait Until Element Is Visible    //li[@class='select2-results__option select2-results__option--highlighted']
    Click Element    //li[@class='select2-results__option select2-results__option--highlighted']

    
    # supporting document
    Choose File    //input[@name='pr_attachment[]']        


    



# ====== end create purchase requisition ======


    Close Browser




