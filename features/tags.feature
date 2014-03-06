Feature: Tagging
  In order to view photos on a certain topic
  As a User
  I want to be able to filter snaps by tag

  Background:
    Given I am a registered user

  Scenario: from the main feed
    Given there are a number of snaps on a number of topics
    And I am on the homepage
    When I click on a tag
    Then I should see all the snaps with that tag