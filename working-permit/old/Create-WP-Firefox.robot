*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

# URLs for accessing the application
${WP_URL}       http://devportal.mmproperty.com/working-permit    # Working Permit Page URL
${LOGIN_URL}    http://devportal.mmproperty.com/login             # Login Page URL

# Credentials for logging in
${EMAIL}        muhammad.zakki@mmproperty.com                     # User email for login
${PASSWORD}     12345                                             # User password for login

# --- Elements Section  ---

# Login Page Elements
${EMAIL_FIELD}        //input[@id='email']                        # Email input field
${PASSWORD_FIELD}     //input[@id='password']                     # Password input field
${LOGIN_BUTTON}       //button[@class='btn btn-primary btn-submit' and @type='submit']     # Login button

# Working Permit Elements - Contractor Information
${CREATE_WP_BUTTON}   //a[@href='http://devportal.mmproperty.com/working-permit/create']  # Button to create a new working permit
${ENTITY_SEARCH_FORM}    //span[@class='select2-selection__rendered' and @id='select2-entity-container']     # Dropdown to search entity
${ENTITY_SEARCH_FIELD}   //input[@class='select2-search__field' and @role='textbox']   # Input field for searching entity
${ENTITY_SELECTED_ITEM}  //li[@class='select2-results__option select2-results__option--highlighted' and @role='treeitem']     # Selected entity item

${TENANT_NAME_FIELD}   //input[@id='tenant_name']                # Input field for tenant name
${TENANT_EMAIL_FIELD}  //input[@id='tenant_email']               # Input field for tenant email

# Working Permit Elements - Job Detail
${COMPANY_FIELD}       //input[@id='company']                    # Input field for the company name
${PIC_FIELD}           //input[@id='pic']                        # Input field for person in charge (PIC)
${PHONE_FIELD}         //input[@id='phone']                      # Input field for the phone number
${EMAIL_1_FIELD}       //input[@id='email1']                     # Input field for an additional email
${TYPE_OF_WORK_FIELD}  //input[@id='type_of_work']               # Input field for the type of work

${START_WORK_DAYS_FIELD}     //input[@id='start_work_days']      # Input field for the start date of work
${START_WORK_DAYS_PICKDATE}  //div[@class='datepicker-container datepicker-dropdown datepicker-top-left']     # Date picker for start date

${END_WORK_DAYS_FIELD}       //input[@id='end_work_days']        # Input field for the end date of work
${END_WORK_DAYS_PICKDATE}    //div[@class='datepicker-container datepicker-dropdown datepicker-top-left']     # Date picker for end date

${WORK_LOCATION_FIELD}  //input[@id='work_location']             # Input field for the work location
${SEND_BUTTON}          //button[@id='btnSubmit']                # Submit button for the form
${CONFIRM_ALERT}        //div[@class='swal2-popup swal2-modal swal2-show']     # Confirmation alert popup
${SUBMIT_BUTTON}        //button[@class='swal2-confirm swal2-styled']     # Submit button within confirmation popup

# Update WP based feedback - Elem
${TOTAL_MAN_POWER_FIELD}    //input[@id='total_man_power']
${ADDRESS_FIELD}    //input[@id='address'] 
${ATTACHMENT_FEEDBACK_FIELD}    //input[@id='attachment']

${UPLOAD_FEEDBACK_BUTTON}    //a[contains(@class, 'btn btn-sm btn-success')][1]

${DETAIL_WP_LINK}    //a[@class='btn btn-sm btn-primary']    

# Form Data for Contractor Information
${SEARCH_TEXT}          MMLP                                      # Text used in entity search
${TENANT_NAME}          Tenant Example                          # Sample tenant name
${TENANT_EMAIL}         rcwjys@gmail.com                        # Sample tenant email

# Form Data for Job Details
${COMPANY}              PT Example                              # Sample company name
${PIC}                  Johndoe                                 # Sample person in charge
${PHONE}                081234567891011                        # Sample phone number
${EMAIL1}               rcwjys@gmail.com                        # Sample email address
${TYPE_OF_WORK}         Maintenance                             # Sample type of work
${WORK_LOCATION}        Jakarta                                 # Sample work location
${START_WORK_DAYS}      11/09/2024                              # Sample start date of work
${END_WORK_DAYS}        12/09/2024                              # Sample end date of work

# Update WP based feedback - value data

${TOTAL_MAN_POWER}    3
${ADDRESS}    Jakarta Timur
${FEEDBACK_FILE}    D:/Intern/MMP/robotframework/source/FSD-MMPBMEF001.pdf



# Browser Type
${BROWSER}              Firefox                                  # Browser type to be used for testing

*** Test Cases ***
Working Permit Test Case
    [Documentation]    To test the Working Permit (WP) system across various roles, including Customer Service, Facility Maintenance, HSE, and Head Of PM.
    # Login to the application
    Open Browser    ${LOGIN_URL}    ${BROWSER}  
    # Set the height and width for the browser
    Set Window Size    width=1920    height=1080

    Input Text    ${EMAIL_FIELD}    ${EMAIL}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain   MMP Portal

    Set Selenium Speed    200ms
    
    # Navigate to the Working Permit page
    Go To   ${WP_URL}
    Page Should Contain   Create
    
    # Fill in Contractor Information
    Click Link    ${CREATE_WP_BUTTON}
    Click Element    ${ENTITY_SEARCH_FORM}
    Input Text    ${ENTITY_SEARCH_FIELD}    ${SEARCH_TEXT}
    Click Element    ${ENTITY_SELECTED_ITEM}
    Input Text    ${TENANT_NAME_FIELD}    ${TENANT_NAME}
    Input Text    ${TENANT_EMAIL_FIELD}    ${TENANT_EMAIL}
    
    # Fill in Job Details
    Input Text    ${COMPANY_FIELD}    ${COMPANY}
    Input Text    ${PIC_FIELD}    ${PIC}
    Input Text    ${PHONE_FIELD}    ${PHONE}
    Input Text    ${EMAIL_1_FIELD}    ${EMAIL1}
    Input Text    ${TYPE_OF_WORK_FIELD}    ${TYPE_OF_WORK}
    
    # Set Work Dates
    Click Element    ${START_WORK_DAYS_FIELD}
    Input Text    ${START_WORK_DAYS_FIELD}    ${START_WORK_DAYS}
    Click Element    ${END_WORK_DAYS_FIELD}
    Input Text    ${END_WORK_DAYS_FIELD}    ${END_WORK_DAYS}
    
    # Set Work Location and Submit
    Input Text    ${WORK_LOCATION_FIELD}    ${WORK_LOCATION}
    Click Button    ${SEND_BUTTON}
    
    # Confirm submission
    Wait Until Element Is Visible    ${CONFIRM_ALERT}
    Click Button    ${SUBMIT_BUTTON}
    
    # Check the result of the submission
    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds
    Location Should Be    ${WP_URL}

    Click Link    ${UPLOAD_FEEDBACK_BUTTON}

    # Update job detail
    Scroll Element Into View    ${TOTAL_MAN_POWER_FIELD}
    Input Text   ${TOTAL_MAN_POWER_FIELD}    ${TOTAL_MAN_POWER}
    Scroll Element Into View    ${ADDRESS_FIELD}
    Input Text    ${ADDRESS_FIELD}    ${ADDRESS}

    # Add Attachment
    Scroll Element Into View    ${ATTACHMENT_FEEDBACK_FIELD}
    Wait Until Element Is Visible    ${ATTACHMENT_FEEDBACK_FIELD}
    
    Choose File    ${ATTACHMENT_FEEDBACK_FIELD}    file_path= \D:\/Intern\/MMP\/robotframework\/source\/FSD-MMPBMEF001.pdf
    Wait Until Element Is Visible    ${SEND_BUTTON}
    Scroll Element Into View    ${SEND_BUTTON}
    Click Button     ${SEND_BUTTON}

    Wait Until Element Is Visible    ${CONFIRM_ALERT}
    Click Button    ${SUBMIT_BUTTON}

    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds
    Location Should Be    ${WP_URL}
    Close Browser
