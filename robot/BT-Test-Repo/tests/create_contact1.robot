*** Settings ***

Resource        cumulusci/robotframework/Salesforce.robot
Resource        ~/btest-submodule/btest_resources/lightning.resource
Library         cumulusci.robotframework.PageObjects

Suite Setup     Open Test Browser
Suite Teardown  Delete Records and Close Browser


*** Test Cases ***

Via API
    ${first_name} =       Get fake data  first_name
    ${last_name} =        Get fake data  last_name

    ${contact_id} =       Salesforce Insert  Contact
    ...                     FirstName=${first_name}
    ...                     LastName=${last_name}

    &{contact} =          Salesforce Get  Contact  ${contact_id}
    Validate Contact      ${contact_id}  ${first_name}  ${last_name}

Via UI
    ${first_name} =             Get fake data   first_name
    ${last_name} =              Get fake data   last_name
    Go to page                  Home    Contact
    Click Object Button         New
    Wait for modal              New     Contact
    Sleep                       1 seconds
    Populate Form
    ...                         First Name=${first_name}
    ...                         Last Name=${last_name}
    Click Modal Button          Save
    Wait Until Modal Is Closed
    ${contact_id} =             Get Current Record Id
    Store Session Record        Contact     ${contact_id}
    Validate Contact            ${contact_id}   ${first_name}   ${last_name}

