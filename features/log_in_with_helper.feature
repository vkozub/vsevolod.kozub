Feature: Log in as a registered user
  As a user
  I want to log in with valid credentials
  In order to access to my account

  Scenario: Log in with valid credentials
    Given I am logged in "member01"
   Then  Account is opened for "member01"
