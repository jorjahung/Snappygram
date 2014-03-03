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
  expect(page).to have_xpath("//img[contains(@src, 'first_snap.jpg')]")
  expect(page).to have_content("Our first snap")
end

When(/^I upload an image$/) do
  fill_in "snap[description]", with: "Uploaded snap!"
  attach_file('snap[image]', '/Users/Abraham/Desktop/snappygram-images/second_snap.jpg')
  click_button 'Upload'
end

Then(/^I should see that snap on the homepage$/) do
  expect(page).to have_xpath("//img[contains(@src, 'second_snap.jpg')]")
  expect(page).to have_content("Uploaded snap!")
end