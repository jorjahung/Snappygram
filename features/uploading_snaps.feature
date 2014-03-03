Feature: Snaps
  
  Background:
    Given there are images

  Scenario: Viewing snaps
    Given I am at the homepage
    Then I should see snaps

  Scenario: Uploading snaps
    Given I am on the new snap page
    When I upload an image
    Then I should see that snap on the homepage
