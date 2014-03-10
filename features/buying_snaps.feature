Feature: Buying snaps
  In order to own someone else's snap
  As a User
  I want to buy that snap

  Background:
    Given I am a registered user
    And someone has uploaded an image

  @wip @iframe @javascript
  Scenario: Buying a snap
    Given I am the page of a snap I want to buy
    When I click the buy button
    And fill in my details
    Then I should have bought the snap