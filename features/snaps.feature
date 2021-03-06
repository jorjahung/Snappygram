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

  Scenario: Snaps should have tags
    Given I am on the new snap page
    When I submit a photo with tags
    Then I should see the tags in the homepage

  Scenario: Seeing a certain number of snaps per page
    Given there are pages of snaps uploaded
    When I visit the homepage
    Then I should only see 10 snaps

  Scenario: Individual snap views
    Given I am at the homepage
    When I click on the first image
    Then I should see the page for that image 

  Scenario: Snaps should show date taken and camera used if known
    Given I have uploaded a photo with a known date and model
    When I view the page for that snap
    Then I should see the date and model

  Scenario: Snaps should show the location of where the picture was taken
    Given I have uploaded a photo with a known location
    When I view the page for that snap
    Then I should see the location

  Scenario: Map of snaps
    Given there are photos with known locations
    When I am on the maps view of all the snaps
    Then I should see all the locations of all the snaps taken ever