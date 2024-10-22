*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

# --- URLs ---
${WP_URL}       http://devportal.mmproperty.com/working-permit    # URL of the Working Permit Page
${LOGIN_URL}    http://devportal.mmproperty.com/login             # URL of the Login Page

# --- Credentials ---
${EMAIL}        muhammad.zakki@mmproperty.com                     # Email address used for login
${PASSWORD}     12345                                             # Password used for login

# --- Element Selectors ---

# Login Page Elements
${EMAIL_FIELD}        //input[@id='email']                        # Selector for the email input field
${PASSWORD_FIELD}     //input[@id='password']                     # Selector for the password input field
${LOGIN_BUTTON}       //button[@class='btn btn-primary btn-submit' and @type='submit']  # Selector for the login button

# Working Permit Page Elements
${CREATE_WP_BUTTON}         //a[@href='http://devportal.mmproperty.com/working-permit/create']  # Button to create a new working permit
${ENTITY_SEARCH_FORM}       //span[@class='select2-selection__rendered' and @id='select2-entity-container']  # Dropdown to search for an entity
${ENTITY_SEARCH_FIELD}      //input[@class='select2-search__field' and @role='textbox']  # Input field to search for an entity
${ENTITY_SELECTED_ITEM}     //li[@class='select2-results__option select2-results__option--highlighted' and @role='treeitem']  # Selector for the selected entity item



${PROJECT_FIELD_SPAN}       //span[@id='select2-project_no-container'] 
${PROJECT_SELECTOR}         //input[@class='select2-search__field']
${PROJECT_SELECTED}         //li[@class='select2-results__option select2-results__option--highlighted']

# Contractor Information Fields
${TENANT_NAME_FIELD}   //input[@id='tenant_name']                # Input field for the tenant's name
${TENANT_EMAIL_FIELD}  //input[@id='tenant_email']               # Input field for the tenant's email address

# Job Details Fields
${COMPANY_FIELD}       //input[@id='company']                    # Input field for the company name
${PIC_FIELD}           //input[@id='pic']                        # Input field for the person in charge (PIC)
${PHONE_FIELD}         //input[@id='phone']                      # Input field for the phone number
${EMAIL_1_FIELD}       //input[@id='email1']                     # Input field for an additional email address
${TYPE_OF_WORK_FIELD}  //input[@id='type_of_work']               # Input field for the type of work

# Work Dates Fields
${START_WORK_DAYS_FIELD}     //input[@id='start_work_days']      # Input field for the work start date
${START_WORK_DAYS_PICKDATE}  //div[@class='datepicker-container datepicker-dropdown datepicker-top-left']  # Date picker for the start date

${END_WORK_DAYS_FIELD}       //input[@id='end_work_days']        # Input field for the work end date
${END_WORK_DAYS_PICKDATE}    //div[@class='datepicker-container datepicker-dropdown datepicker-top-left']  # Date picker for the end date

# Work Location and Submission
${WORK_LOCATION_FIELD}  //input[@id='work_location']             # Input field for the work location
${SEND_BUTTON}          //button[@id='btnSubmit']                # Button to submit the working permit form
${CONFIRM_ALERT}        //div[@class='swal2-popup swal2-modal swal2-show']  # Confirmation alert popup after form submission
${SUBMIT_BUTTON}        //button[@class='swal2-confirm swal2-styled']  # Button to confirm the submission in the alert popup

# Update Working Permit Elements
${TOTAL_MAN_POWER_FIELD}      //input[@id='total_man_power']     # Input field for total manpower
${ADDRESS_FIELD}              //input[@id='address']             # Input field for the address
${ATTACHMENT_FEEDBACK_FIELD}  //input[@id='attachment']          # Input field for uploading feedback attachment
${UPLOAD_FEEDBACK_BUTTON}     //a[contains(@class, 'btn btn-sm btn-success')][1]  # Button to upload feedback
${DETAIL_WP_LINK}             //a[@class='btn btn-sm btn-primary']  # Link to view working permit details

# --- Sample Data for Form Filling ---
# Contractor Information
${SEARCH_TEXT}          ILO                                    # Search text for the entity
${TENANT_NAME}          Tenant Example                          # Sample name of the tenant



${PROJECT}              Intirub

${TENANT_EMAIL}         rcwjys@gmail.com                        # Sample email address of the tenant

# Job Details
${COMPANY}              PT Example                              # Sample company name
${PIC}                  Johndoe                                 # Sample name of the person in charge
${PHONE}                081234567891011                         # Sample phone number
${EMAIL1}               rcwjys@gmail.com                        # Sample additional email address
${TYPE_OF_WORK}         Maintenance                             # Sample type of work description
${WORK_LOCATION}        Jakarta                                 # Sample work location
${START_WORK_DAYS}      11/09/2024                              # Sample work start date
${END_WORK_DAYS}        12/09/2024                              # Sample work end date

# Update Working Permit Feedback Data
${TOTAL_MAN_POWER}    3                                         # Sample total manpower
${ADDRESS}            Jakarta Timur                             # Sample address for the update
${FEEDBACK_FILE}      D:/Intern/MMP/robotframework/source/FSD-MMPBMEF001.pdf  # Path to the feedback file

# --- Browser Configuration ---
${BROWSER}              Chrome                                  # Browser type used for testing

*** Test Cases ***
Working Permit Test Case
    [Documentation]    Test the Working Permit (WP) system by performing login, creating a permit, and updating job details. This covers multiple roles including Customer Service, Facility Maintenance, HSE, and Head Of PM.
    
    # Step 1: Login to the application
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text      ${EMAIL_FIELD}    ${EMAIL}
    Input Password  ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain   MMP Portal    # Verifies successful login by checking portal presence
    
    # Step 2: Navigate to the Working Permit page
    Go To   ${WP_URL}
    Page Should Contain   Create        # Checks if the 'Create' button is available
    
    # Step 3: Fill in Contractor Information
    Click Link          ${CREATE_WP_BUTTON}
    Click Element       ${ENTITY_SEARCH_FORM}
    Input Text          ${ENTITY_SEARCH_FIELD}    ${SEARCH_TEXT}
    Click Element       ${ENTITY_SELECTED_ITEM}
    Input Text          ${TENANT_NAME_FIELD}    ${TENANT_NAME}
    Wait Until Element Is Visible    ${PROJECT_FIELD_SPAN}
    Click Element       ${PROJECT_FIELD_SPAN}
    Wait Until Element Is Visible    ${PROJECT_FIELD_SPAN}
    Input Text          ${PROJECT_SELECTOR}    ${PROJECT}
    Wait Until Element Is Visible     ${PROJECT_SELECTED}
    Click Element       ${PROJECT_SELECTED}
    Input Text          ${TENANT_EMAIL_FIELD}    ${TENANT_EMAIL}
    
    # Step 4: Fill in Job Details
    Input Text          ${COMPANY_FIELD}    ${COMPANY}
    Input Text          ${PIC_FIELD}    ${PIC}
    Input Text          ${PHONE_FIELD}    ${PHONE}
    Input Text          ${EMAIL_1_FIELD}    ${EMAIL1}
    Input Text          ${TYPE_OF_WORK_FIELD}    ${TYPE_OF_WORK}
    
    # Step 5: Set Work Dates
    Click Element       ${START_WORK_DAYS_FIELD}
    Input Text          ${START_WORK_DAYS_FIELD}    ${START_WORK_DAYS}
    Click Element       ${END_WORK_DAYS_FIELD}
    Input Text          ${END_WORK_DAYS_FIELD}    ${END_WORK_DAYS}
    
    # Step 6: Set Work Location and Submit
    Input Text          ${WORK_LOCATION_FIELD}    ${WORK_LOCATION}
    Click Button        ${SEND_BUTTON}
    
    # Step 7: Confirm Submission
    Wait Until Element Is Visible    ${CONFIRM_ALERT}
    Click Button        ${SUBMIT_BUTTON}
    
    # Step 8: Check Submission Result
    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds
    Location Should Be    ${WP_URL}    # Verifies successful submission by checking URL
    
    # Step 9: Upload Feedback and Update Job Details
    Click Link          ${UPLOAD_FEEDBACK_BUTTON}
    Scroll Element Into View    ${TOTAL_MAN_POWER_FIELD}
    Input Text          ${TOTAL_MAN_POWER_FIELD}    ${TOTAL_MAN_POWER}
    Scroll Element Into View    ${ADDRESS_FIELD}
    Input Text          ${ADDRESS_FIELD}    ${ADDRESS}
    
    # Step 10: Add Attachment
    Wait Until Element Is Visible    ${ATTACHMENT_FEEDBACK_FIELD}
    Scroll Element Into View    ${ATTACHMENT_FEEDBACK_FIELD}
    Choose File         ${ATTACHMENT_FEEDBACK_FIELD}  ${FEEDBACK_FILE}
    
    # Step 11: Submit Feedback
    Wait Until Element Is Visible    ${SEND_BUTTON}
    Scroll Element Into View    ${SEND_BUTTON}
    Click Button        ${SEND_BUTTON}
    
    Wait Until Element Is Visible    ${CONFIRM_ALERT}
    Click Button        ${SUBMIT_BUTTON}
    
    # Step 12: Final Verification of Submission
    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds
    Location Should Be    ${WP_URL}    # Final check to ensure feedback was submitted successfully
