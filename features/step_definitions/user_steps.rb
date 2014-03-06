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

Given(/^there are images posted by a user$/) do
  visit new_user_registration_path
  fill_in "user[username]", with: "snoopybabe"
  fill_in "user[fullname]", with: "Snoopy Babe"
  fill_in "user[email]", with: "snoopybabe@snoopybabe.com"
  fill_in "user[location]", with: "United Kingdom"
  fill_in "user[password]", with: "snoopybabe"
  fill_in "user[password_confirmation]", with: "snoopybabe"
  click_button "Sign Up"
  visit new_snap_path
  fill_in "snap[description]", with: "Second page!"
  attach_file('snap[image]', '/Users/jorja/Desktop/snappygram-images/first_snap.jpg')
  fill_in "snap[tags]", with: "cat unicorn"
  click_button 'Upload'
end



When(/^I click "(.*?)"$/) do |button_name|
  click_link button_name
end

When(/^I fill out the sign in form$/) do
  fill_in "user[email]", with: "snoopybabe@snoopybabe.com"
  fill_in "user[password]", with: "snoopybabe"
  click_button "Sign In"
end

When(/^I am on the new snaps page$/) do
  visit new_snap_path
end

When(/^I click on a user's name$/) do
  click_link "snoopybabe"
end

Then(/^I should be signed in$/) do
  expect(page).to have_content("Sign Out")
  expect(page).not_to have_content("Sign In")
end

Then(/^I should be signed out$/) do
  expect(page).to have_content("Signed out successfully.")
  expect(page).not_to have_content("Sign Out")
end

Then(/^I should not be able to post snaps$/) do
  expect(current_path).to eq(new_user_session_path)
end

Then(/^I should see the sign up page$/) do
  expect(page).to have_content("snoopybabe")
  expect(current_path).to eq(new_user_registration_path)
end

Then(/^I should see the user's full name$/) do
  expect(page).to have_content("Snoopy Babe")
end

Then(/^I should see the user's location$/) do
  expect(page).to have_content("United Kingdom")
end



