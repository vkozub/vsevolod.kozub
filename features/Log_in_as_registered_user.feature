Feature: Log in as a registered user
  As a user
  I want to log in with valid credentials
  In order to access to my account

  Scenario: Log in with valid credentials
    Given I am not logged in user

    When  I click Sign in button
    Then  Login page is opened

    When  I fill valid credentials in
    And   I click Login button
    Then  I am logged in
