Given(/^there are images$/) do
  first_snap = Snap.new(description: "Our first snap")
  first_snap.image = File.open('/Users/Abraham/Desktop/snappygram-images/first_snap.jpg')
  first_snap.save
end

Given(/^I am at the homepage$/) do
  visit root_path
end

Then(/^I should see snaps$/) do
  expect(page).to have_xpath("//img")
  expect(page).to have_content("Our first snap")
end