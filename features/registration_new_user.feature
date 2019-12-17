Feature: Registration as a new user
  As a new user
  I want to register with valid data
  In order to use RedMine

  Scenario: Registration with valid data
    Given I am not registered user

    When I click Register link
    Then Registration page is opened

    When I fill in valid data
    And I click submit button
    Then I am an registered user

  Scenario: Signing out and verifying of access
    Given I sign out from my account
    Then I navigate to homepage

    When I click on Sign in link
    Then  Login page is opened

    When I fill in my credentials
    And I click on Login button
    Then I am accessed to my account
