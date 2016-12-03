Feature: Sign in
  In order to allow users to use the system
  I want to sign in this system.

  Scenario: Sign in to the system

    Officers should be able to sign in.

    Given My role is Admin
    And I am a admin
    When I visit the Homepage of the Accommodation System
    Then I should see a link for sign in
    When I click the link for sign in
    Then I see a form to fill in my account
    When I submit the form
    Then I am redirected to the start page
    And I should see my signed in and a link to sign out

#    Given I am a staff
#    And there is a sign in page
#    And I want to sign in
#    When I visit the Homepage of the Accommodation System
#    Then I should see a link for sign in
#    When I click the link for sign in
#    Then I see a form to fill in my details
#    When I submit the form
#    Then I am redirected to the start page