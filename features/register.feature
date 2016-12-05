Feature: Register
  In order to allow users to use the system
  Officers have to register an account.

  Scenario: User registration

    User should be able to register before admin gives a role.

    Given I am a user
    And I want to register account
    When I visit the Homepage of the Accommodation System
    Then I should see a link for sign up
    When I click the link for sign up
    Then I see a form to fill in my registration detail
    When I submit the registration form
    Then I am redirected to the start page
    And I should see my signed