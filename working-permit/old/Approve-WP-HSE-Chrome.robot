*** Settings ***
# Importing libraries for browser automation and date-time handling
Library    SeleniumLibrary    # Library for web browser automation using Selenium
Library    DateTime           # Library for date and time operations

*** Variables ***

# URLs for navigating within the application
${WP_URL}       http://devportal.mmproperty.com/working-permit    # URL for the Working Permit page
${LOGIN_URL}    http://devportal.mmproperty.com/login             # URL for the Login page

# Login credentials for the HSE role
${EMAIL}        rizal.widianto@mmproperty.com                    # Email address used for login
${PASSWORD}     superFor                                          # Password for the login email

# --- Elements Section ---

# Locators for elements on the Login page
${EMAIL_FIELD}        //input[@id='email']                        # XPath for the email input field
${PASSWORD_FIELD}     //input[@id='password']                     # XPath for the password input field
${LOGIN_BUTTON}       //button[@class='btn btn-primary btn-submit' and @type='submit']  # XPath for the login button

# Locators for elements used during approval
${CONFIRM_ALERT}        //div[@class='swal2-popup swal2-modal swal2-show']  # XPath for the confirmation alert dialog
${DETAIL_WP_LINK}       //a[@class='btn btn-sm btn-primary']                # XPath for the link to view working permit details
${REVIEW_LINK}          //a[@class='btn btn-sm btn-warning']                # XPath for review links available on the page
${NEWEST_REVIEW_LINK}   //a[contains(@class, 'btn btn-sm btn-warning')][1]  # XPath for the latest review link
${REVIEW_BUTTON}        //button[@id='btnReview']                           # XPath for the review button to open the review form
${APPROVE_BUTTON}       //button[@class='swal2-cancel swal2-styled']        # XPath for the approve button within the alert dialog

# Browser settings
${BROWSER}              Chrome  # Specifies the browser type for the test (e.g., Chrome)

*** Test Cases ***
# Test case to approve a working permit by HSE
Working Permit Approval By HSE
    [Documentation]    This test case simulates the approval process of a working permit by a Health, Safety, and Environment (HSE) user. The test logs into the application, navigates to the working permit section, and performs the approval action.

    # Step 1: Open the browser and log into the application
    Open Browser    ${LOGIN_URL}    ${BROWSER}                 # Opens the login page in the specified browser
    Input Text      ${EMAIL_FIELD}  ${EMAIL}                   # Enters the email address into the email input field
    Input Password  ${PASSWORD_FIELD}  ${PASSWORD}             # Enters the password into the password input field
    Click Button    ${LOGIN_BUTTON}                            # Clicks the login button to authenticate the user
    Page Should Contain   MMP Portal                           # Verifies successful login by checking that the page contains the expected text "MMP Portal"

    # Step 2: Navigate to the Working Permit page and open the latest review entry
    Go To    ${WP_URL}                                        # Navigates to the Working Permit page
    Wait Until Element Is Visible    ${REVIEW_LINK}           # Waits until the review link is visible to ensure the page is fully loaded
    Click Link    ${NEWEST_REVIEW_LINK}                       # Clicks on the newest review link to access the review section

    # Step 3: Perform the review action and approve the working permit
    Scroll Element Into View    ${REVIEW_BUTTON}              # Scrolls to the review button to bring it into view
    Click Button    ${REVIEW_BUTTON}                          # Clicks the review button to initiate the review process
    Wait Until Element Is Visible    ${CONFIRM_ALERT}         # Waits until the confirmation alert is displayed on the screen
    Click Button    ${APPROVE_BUTTON}                         # Clicks the approve button within the confirmation alert to approve the working permit

    # Step 4: Validate that the approval was successful
    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds  # Waits until the details link is visible to confirm the process
    Location Should Be    ${WP_URL}                                   # Verifies that the user is redirected to the correct URL after approval
