Feature: User administration
  In order to admin can manage in administration page.
  Admin has to see registered user, ban a user and see statistics page

  Scenario: Admin sees registered user and bans user

  Admin should be able to see registered users and ban user.

    Given My role is Admin
    And I am a admin
    When I want to sign in
    And I click the link for sign in
    Then I see a form to fill in
    When I sign in
    Then I am redirected to the start page
    And I should see a link of registered users
    When I click the link of registered users
    Then I should see all users

    Given I have a staff user
    When I click the link for ban
    Then I should see a status of user is non-active

    When I want to see statistics page
    Then I should see a link of statistics page
    When I click the link of statistics page
    Then I should see about statistic of user registration