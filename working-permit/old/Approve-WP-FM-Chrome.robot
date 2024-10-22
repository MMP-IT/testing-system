*** Settings ***
# Importing necessary libraries for the test automation
Library    SeleniumLibrary   # Library used for browser automation and interaction with web elements
Library    DateTime          # Library used for handling date and time operations

*** Variables ***

# URLs for accessing different pages of the application
${WP_URL}       http://devportal.mmproperty.com/working-permit    # URL of the Working Permit page
${LOGIN_URL}    http://devportal.mmproperty.com/login             # URL of the Login page

# User credentials for logging in as Facility Management
${EMAIL}        wisnu.hadiyanto@mmproperty.com                    # Email address used for login
${PASSWORD}     superFor                                           # Password associated with the login email

# --- Elements Section ---

# Locators for elements on the Login page
${EMAIL_FIELD}        //input[@id='email']                        # XPath locator for the email input field
${PASSWORD_FIELD}     //input[@id='password']                     # XPath locator for the password input field
${LOGIN_BUTTON}       //button[@class='btn btn-primary btn-submit' and @type='submit']  # XPath locator for the login button

# Locators for elements related to working permit approval
${CONFIRM_ALERT}        //div[@class='swal2-popup swal2-modal swal2-show']  # XPath locator for the confirmation alert dialog box
${DETAIL_WP_LINK}       //a[@class='btn btn-sm btn-primary']                # XPath locator for the link to view working permit details
${REVIEW_LINK}          //a[@class='btn btn-sm btn-warning']                # XPath locator for the review link in the working permit section
${NEWEST_REVIEW_LINK}   //a[contains(@class, 'btn btn-sm btn-warning')][1]  # XPath locator for the link to the latest review entry
${REVIEW_BUTTON}        //button[@id='btnReview']                           # XPath locator for the review button
${APPROVE_BUTTON}       //button[@class='swal2-cancel swal2-styled']        # XPath locator for the button to approve the working permit

# Browser settings
${BROWSER}              Chrome  # Specifies the browser type to be used for testing (e.g., Chrome)

*** Test Cases ***
# Test case to approve a working permit by Facility Management
Working Permit Approval By Facility Management
    [Documentation]    This test case simulates the approval process of a working permit by a Facility Management user. The test logs into the application, navigates to the working permit section, and performs the approval action.

    # Step 1: Open the browser and log into the application
    Open Browser    ${LOGIN_URL}    ${BROWSER}       # Opens the login page in the specified browser
    Input Text      ${EMAIL_FIELD}  ${EMAIL}         # Enters the email address into the email input field
    Input Password  ${PASSWORD_FIELD}  ${PASSWORD}   # Enters the password into the password input field
    Click Button    ${LOGIN_BUTTON}                  # Clicks the login button to authenticate the user
    Page Should Contain   MMP Portal                 # Verifies successful login by checking that the page contains expected text

    # Step 2: Navigate to the Working Permit page and open the latest review entry
    Go To    ${WP_URL}                              # Navigates to the Working Permit page
    Wait Until Element Is Visible    ${REVIEW_LINK}    # Waits until the review link is visible to ensure the page is loaded
    Click Link    ${NEWEST_REVIEW_LINK}              # Clicks on the newest review link to access the review section

    # Step 3: Perform the review action and approve the working permit
    Scroll Element Into View    ${REVIEW_BUTTON}     # Scrolls to the review button to bring it into view
    Click Button    ${REVIEW_BUTTON}                 # Clicks the review button to initiate the review process
    Wait Until Element Is Visible    ${CONFIRM_ALERT}     # Waits until the confirmation alert is displayed on the screen
    Click Button    ${APPROVE_BUTTON}                # Clicks the approve button to confirm the working permit approval

    # Step 4: Validate that the approval was successful
    Wait Until Element Is Visible    ${DETAIL_WP_LINK}    timeout=30 seconds  # Waits until the details link is visible to confirm the process
    Location Should Be    ${WP_URL}                                      # Verifies that the user is redirected to the correct URL after approval
