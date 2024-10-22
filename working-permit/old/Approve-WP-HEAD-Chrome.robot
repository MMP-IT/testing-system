*** Settings ***
Library    SeleniumLibrary        # Library for web browser automation using Selenium
Library    DateTime               # Library for handling date and time operations

*** Variables ***

# URLs for accessing the application
${WP_URL}       http://devportal.mmproperty.com/working-permit    # Working Permit Page URL
${LOGIN_URL}    http://devportal.mmproperty.com/login             # Login Page URL

# Credentials for logging in as Head Of PM
${EMAIL}        wahyudi@mmproperty.com                           # User email for login
${PASSWORD}     superFor                                           # User password for login

# --- Elements Section ---

# Login Page Elements
${EMAIL_FIELD}        //input[@id='email']                        # XPath for the email input field
${PASSWORD_FIELD}     //input[@id='password']                     # XPath for the password input field
${LOGIN_BUTTON}       //button[@class='btn btn-primary btn-submit' and @type='submit']   # XPath for the login button

# Elements for the review and approval process
${CONFIRM_ALERT}        //div[@class='swal2-popup swal2-modal swal2-show']  # XPath for the confirmation alert
${DETAIL_WP_LINK}       //a[@class='btn btn-sm btn-primary']                # XPath for the link to view working permit details
${REVIEW_LINK}          //a[@class='btn btn-sm btn-warning']                # XPath for all review links
${NEWEST_REVIEW_LINK}   //a[contains(@class, 'btn btn-sm btn-warning')][1]  # XPath for the latest review link
${REVIEW_BUTTON}        //button[@id='btnReview']                           # XPath for the button to start the review
${APPROVE_BUTTON}      //button[@class='swal2-cancel swal2-styled']       # XPath for the approval button within the alert

# Browser settings
${BROWSER}                Chrome                                              # Browser type for testing

*** Test Cases ***
# Test case to approve a working permit by Head
Working Permit Approval By Head
    [Documentation]    This test case simulates the approval process of a working permit by a Head Of PM user. The test logs into the application, navigates to the working permit section, and performs the approval action.

    # Step 1: Open the browser and log into the application
    Open Browser    ${LOGIN_URL}    ${BROWSER}                  # Opens the login page in the specified browser
    Input Text      ${EMAIL_FIELD}   ${EMAIL}                   # Enters the email address into the email input field
    Input Password  ${PASSWORD_FIELD}  ${PASSWORD}              # Enters the password into the password input field
    Click Button    ${LOGIN_BUTTON}                             # Clicks the login button to authenticate the user
    Page Should Contain   MMP Portal                            # Verifies successful login by checking that the page contains "MMP Portal"

    # Step 2: Navigate to the Working Permit page and open the latest review entry
    Go To    ${WP_URL}                                         # Navigates to the Working Permit page
    Wait Until Element Is Visible    ${REVIEW_LINK}    timeout=30 seconds  # Waits until the review link is visible
    Click Link    ${NEWEST_REVIEW_LINK}                        # Clicks on the newest review link

    # Step 3: Perform the review action and approve the working permit
    Scroll Element Into View    ${REVIEW_BUTTON}               # Scrolls to the review button to bring it into view
    Click Button    ${REVIEW_BUTTON}                           # Clicks the review button to initiate the review process
    Wait Until Element Is Visible    ${CONFIRM_ALERT}          # Waits until the confirmation alert is displayed
    Click Button    ${APPROVE_BUTTON}                          # Clicks the approve button within the confirmation alert

    # Step 4: Validate that the approval was successful
    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds  # Waits until the details link is visible to confirm the approval
    Location Should Be    ${WP_URL}                                    # Verifies that the user is redirected back to the correct URL after approval
