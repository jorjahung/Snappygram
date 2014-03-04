Given(/^I am a registered user$/) do
  visit new_user_registration_path
  fill_in "user[username]", with: "snoopybabe"
  fill_in "user[email]", with: "snoopybabe@snoopybabe.com"
  fill_in "user[password]", with: "snoopybabe"
  fill_in "user[password_confirmation]", with: "snoopybabe"
  click_button "Sign Up"
end

Given(/^I am signed out$/) do
  visit root_path
  click_link "Sign Out"
end

When(/^I click "(.*?)"$/) do |button_name|
  click_link button_name
end

When(/^I fill out the sign in form$/) do
  fill_in "user[email]", with: "snoopybabe@snoopybabe.com"
  fill_in "user[password]", with: "snoopybabe"
  click_button "Sign In"
end

Then(/^I should be signed in$/) do
  expect(page).to have_content("Sign Out")
  expect(page).not_to have_content("Sign In")
end

Then(/^I should be signed out$/) do
  expect(page).to have_content("Signed out successfully.")
  expect(page).not_to have_content("Sign Out")
end