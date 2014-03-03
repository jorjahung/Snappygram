Given(/^there are images$/) do
  first_snap = Snap.new(description: "Our first snap")
  first_snap.image = File.open('/Users/Abraham/Desktop/snappygram-images/first_snap.jpg')
  first_snap.save
end

Given(/^I am at the homepage$/) do
  visit root_path
end

Given(/^I am on the new snap page$/) do
  visit new_snap_path
end

Then(/^I should see snaps$/) do
  expect(page).to have_xpath("//img")
  expect(page).to have_content("Our first snap")
end

When(/^I upload an image$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see that snap on the homepage$/) do
  pending # express the regexp above with the code you wish you had
end