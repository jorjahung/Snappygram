Feature: Snaps
  
  Background:
    Given there are images
    And I am a registered user

  Scenario: Viewing snaps
    Given I am at the homepage
    Then I should see snaps

  Scenario: Uploading snaps
    Given I am on the new snap page
    When I upload an image
    Then I should see that snap on the homepage

  Scenario: Snaps in order
    Given I have uploaded an image
    When I am at the homepage
    Then I should see in this order:
      |Uploaded snap!|
      |Our first snap|

  Scenario: Snaps should have user name
    Given I have uploaded an image
    When I am at the home page
    Then I should see my username
