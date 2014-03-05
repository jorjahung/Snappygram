Feature: Live snaps

	@javascript
	Scenario: Another User posts snap
 		Given I am on the homepage
 		When someone posts a photo
 		Then I should see the photo

