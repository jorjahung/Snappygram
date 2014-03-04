Feature: User Authentication

  Background:
    Given I am a registered user

  Scenario: Signing out from the hompage
    Given I am at the homepage
    When I click "Sign Out"
    Then I should be signed out

  Scenario: Signing in from the homepage
    Given I am signed out
    And I am on the homepage
    When I click "Sign In"
    And I fill out the sign in form
    Then I should be signed in