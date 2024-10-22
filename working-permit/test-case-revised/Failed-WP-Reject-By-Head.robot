*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

${WP_URL}       http://devportal.mmproperty.com/working-permit    
${LOGIN_URL}    http://devportal.mmproperty.com/login             

${EMAIL}        muhammad.zakki@mmproperty.com                     
${PASSWORD}     12345                                             

${FM_EMAIL}     wisnu.hadiyanto@mmproperty.com
${GENERAL_PASSWORD}  superFor

${HSE_EMAIL}    rizal.widianto@mmproperty.com
${HEAD_EMAIL}   wahyudi@mmproperty.com

${EMAIL_FIELD}        //input[@id='email']                        
${PASSWORD_FIELD}     //input[@id='password']                     
${LOGIN_BUTTON}       //button[@class='btn btn-primary btn-submit' and @type='submit']  

${LOGIN_FORM}    //div[@class='col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-4']

${CREATE_WP_BUTTON}         //a[@href='http://devportal.mmproperty.com/working-permit/create']  
${ENTITY_SEARCH_FORM}       //span[@class='select2-selection__rendered' and @id='select2-entity-container']  
${ENTITY_SEARCH_FIELD}      //input[@class='select2-search__field' and @role='textbox']  
${ENTITY_SELECTED_ITEM}     //li[@class='select2-results__option select2-results__option--highlighted' and @role='treeitem']  

${PROJECT_FIELD_SPAN}       //span[@id='select2-project_no-container'] 
${PROJECT_SELECTOR}         //input[@class='select2-search__field']
${PROJECT_SELECTED}         //li[@class='select2-results__option select2-results__option--highlighted']

${TENANT_NAME_FIELD}   //input[@id='tenant_name']                
${TENANT_EMAIL_FIELD}  //input[@id='tenant_email']               

${COMPANY_FIELD}       //input[@id='company']                    
${PIC_FIELD}           //input[@id='pic']                        
${PHONE_FIELD}         //input[@id='phone']                      
${EMAIL_1_FIELD}       //input[@id='email1']                     
${TYPE_OF_WORK_FIELD}  //input[@id='type_of_work']               

${START_WORK_DAYS_FIELD}     //input[@id='start_work_days']      
${START_WORK_DAYS_PICKDATE}  //div[@class='datepicker-container datepicker-dropdown datepicker-top-left']  

${END_WORK_DAYS_FIELD}       //input[@id='end_work_days']        
${END_WORK_DAYS_PICKDATE}    //div[@class='datepicker-container datepicker-dropdown datepicker-top-left']  

${WORK_LOCATION_FIELD}  //input[@id='work_location']             
${SEND_BUTTON}          //button[@id='btnSubmit']                
${CONFIRM_ALERT}        //div[@class='swal2-popup swal2-modal swal2-show']  
${SUBMIT_BUTTON}        //button[@class='swal2-confirm swal2-styled']  

${TOTAL_MAN_POWER_FIELD}      //input[@id='total_man_power']     
${ADDRESS_FIELD}              //input[@id='address']             
${ATTACHMENT_FEEDBACK_FIELD}  //input[@id='attachment']          
${UPLOAD_FEEDBACK_BUTTON}     //a[contains(@class, 'btn btn-sm btn-success')][1]  
${DETAIL_WP_LINK}             //a[@class='btn btn-sm btn-primary']  

${REVIEW_LINK}          //a[@class='btn btn-sm btn-warning']                
${NEWEST_REVIEW_LINK}   //a[contains(@class, 'btn btn-sm btn-warning')][1]  
${REVIEW_BUTTON}        //button[@id='btnReview']                           
${APPROVE_BUTTON}       //button[@class='swal2-cancel swal2-styled']        

${REASON_FIELD}         //textarea[@class='swal2-textarea']                 
${REJECT_BUTTON}        //button[@class='swal2-confirm swal2-styled']       

${SEARCH_TEXT}          ILO                                    
${TENANT_NAME}          Tenant Example                          

${PROJECT}              Intirub

${TENANT_EMAIL}         rcwjys@gmail.com                        

${COMPANY}              PT Example                              
${PIC}                  Johndoe                                 
${PHONE}                081234567891011                         
${EMAIL1}               rcwjys@gmail.com                        
${TYPE_OF_WORK}         Maintenance                             
${WORK_LOCATION}        Jakarta                                 
${START_WORK_DAYS}      11/09/2024                              
${END_WORK_DAYS}        12/09/2024                              

${TOTAL_MAN_POWER}    3                                         
${ADDRESS}            Jakarta Timur                             
${FEEDBACK_FILE}      D:/Intern/MMP/robotframework/source/FSD-MMPBMEF001.pdf  

${REASON}               reject reason   

${BROWSER}              Chrome                                  

*** Test Cases ***
Create Working Permit By Customer Service
    [Documentation]    Test the Working Permit (WP) system by performing login, creating a permit, and updating job details. This covers multiple roles including Customer Service, Facility Maintenance, HSE, and Head Of PM.

    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Wait Until Element Is Visible    ${LOGIN_FORM}    timeout=30 seconds
    Input Text      ${EMAIL_FIELD}    ${EMAIL}
    Input Password  ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain   MMP Portal    

    Go To   ${WP_URL}
    Page Should Contain   Create        

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

    Input Text          ${COMPANY_FIELD}    ${COMPANY}
    Input Text          ${PIC_FIELD}    ${PIC}
    Input Text          ${PHONE_FIELD}    ${PHONE}
    Input Text          ${EMAIL_1_FIELD}    ${EMAIL1}
    Input Text          ${TYPE_OF_WORK_FIELD}    ${TYPE_OF_WORK}

    Click Element       ${START_WORK_DAYS_FIELD}
    Input Text          ${START_WORK_DAYS_FIELD}    ${START_WORK_DAYS}
    Click Element       ${END_WORK_DAYS_FIELD}
    Input Text          ${END_WORK_DAYS_FIELD}    ${END_WORK_DAYS}

    Input Text          ${WORK_LOCATION_FIELD}    ${WORK_LOCATION}
    Click Button        ${SEND_BUTTON}

    Wait Until Element Is Visible    ${CONFIRM_ALERT}
    Click Button        ${SUBMIT_BUTTON}

    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds
    Location Should Be    ${WP_URL}    
    Close Browser

Update Working Permit By Customer Service
    [Documentation]    Updating the Job Details By Customer Service By Feedback

    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Wait Until Element Is Visible    ${LOGIN_FORM}    timeout=30 seconds
    Input Text      ${EMAIL_FIELD}    ${EMAIL}
    Input Password  ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain   MMP Portal    

    Go To   ${WP_URL}
    Page Should Contain   Create        

    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds
    Location Should Be    ${WP_URL}    

    Click Link          ${UPLOAD_FEEDBACK_BUTTON}
    Scroll Element Into View    ${TOTAL_MAN_POWER_FIELD}
    Input Text          ${TOTAL_MAN_POWER_FIELD}    ${TOTAL_MAN_POWER}
    Scroll Element Into View    ${ADDRESS_FIELD}
    Input Text          ${ADDRESS_FIELD}    ${ADDRESS}

    Wait Until Element Is Visible    ${ATTACHMENT_FEEDBACK_FIELD}
    Scroll Element Into View    ${ATTACHMENT_FEEDBACK_FIELD}
    Choose File         ${ATTACHMENT_FEEDBACK_FIELD}  ${FEEDBACK_FILE}

    Wait Until Element Is Visible    ${SEND_BUTTON}
    Scroll Element Into View    ${SEND_BUTTON}
    Click Button        ${SEND_BUTTON}

    Wait Until Element Is Visible    ${CONFIRM_ALERT}
    Click Button        ${SUBMIT_BUTTON}

    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds
    Location Should Be    ${WP_URL}    
    Close Browser

Working Permit Approval By Facility Management
    [Documentation]    This test case simulates the approval process of a working permit by a Facility Management user. The test logs into the application, navigates to the working permit section, and performs the approval action.

    Open Browser    ${LOGIN_URL}    ${BROWSER}       
    Wait Until Element Is Visible    ${LOGIN_FORM}    timeout=30 seconds
    Input Text      ${EMAIL_FIELD}  ${FM_EMAIL}         
    Input Password  ${PASSWORD_FIELD}  ${GENERAL_PASSWORD}   
    Click Button    ${LOGIN_BUTTON}                  
    Page Should Contain   MMP Portal                 

    Go To    ${WP_URL}                              
    Wait Until Element Is Visible    ${REVIEW_LINK}    
    Click Link    ${NEWEST_REVIEW_LINK}              

    Scroll Element Into View    ${REVIEW_BUTTON}     
    Click Button    ${REVIEW_BUTTON}                 
    Wait Until Element Is Visible    ${CONFIRM_ALERT}     
    Click Button    ${APPROVE_BUTTON}                

    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds  
    Location Should Be    ${WP_URL}                                      
    Close Browser

Working Permit Approval By HSE
    [Documentation]    This test case simulates the approval process of a working permit by a Health, Safety, and Environment (HSE) user. The test logs into the application, navigates to the working permit section, and performs the approval action.

    Open Browser    ${LOGIN_URL}    ${BROWSER}    
    Sleep    3 seconds             
    Wait Until Element Is Visible    ${LOGIN_FORM}    timeout=30 seconds
    Input Text      ${EMAIL_FIELD}  ${HSE_EMAIL}                   
    Input Password  ${PASSWORD_FIELD}  ${GENERAL_PASSWORD}             
    Click Button    ${LOGIN_BUTTON}                            
    Page Should Contain   MMP Portal                           

    Go To    ${WP_URL}                                        
    Wait Until Element Is Visible    ${REVIEW_LINK}           
    Click Link    ${NEWEST_REVIEW_LINK}                       

    Scroll Element Into View    ${REVIEW_BUTTON}              
    Click Button    ${REVIEW_BUTTON}                          
    Wait Until Element Is Visible    ${CONFIRM_ALERT}         
    Click Button    ${APPROVE_BUTTON}                         

    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds  
    Location Should Be    ${WP_URL}                                   
    Close Browser

Working Permit Rejection By Head
    [Documentation]    This test case simulates the rejection process of a working permit by a Head user. The test logs into the application, navigates to the working permit section, and performs the rejection action.

    Open Browser    ${LOGIN_URL}    ${BROWSER}   
    Wait Until Element Is Visible    ${LOGIN_FORM}             
    Input Text      ${EMAIL_FIELD}    ${HEAD_EMAIL}                   
    Input Password  ${PASSWORD_FIELD}  ${GENERAL_PASSWORD}              
    Click Button    ${LOGIN_BUTTON}                             
    Page Should Contain   MMP Portal                            

    Go To    ${WP_URL}                                         
    Wait Until Element Is Visible    ${REVIEW_LINK}    timeout=30 seconds  
    Click Link    ${NEWEST_REVIEW_LINK}                        

    Scroll Element Into View    ${REVIEW_BUTTON}               
    Click Button    ${REVIEW_BUTTON}                           
    Wait Until Element Is Visible    ${CONFIRM_ALERT}          
    Input Text    ${REASON_FIELD}    ${REASON}                 
    Click Button    ${REJECT_BUTTON}                          

    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds  
    Location Should Be    ${WP_URL}                                    