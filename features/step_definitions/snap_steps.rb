Given(/^there are images$/) do
  first_snap = Snap.new(description: "Our first snap")
  first_snap.image = File.open('/Users/jameshunter/Desktop/snappygram-images/first_snap.jpg')
  first_snap.save
end

Given(/^I am (?:at|on) the homepage$/) do
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
  attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/second_snap.jpg')
  click_button 'Upload'
end

Then(/^I should see that snap on the homepage$/) do
  expect(page).to have_xpath("//img[contains(@src, 'second_snap.jpg')]")
  expect(page).to have_content("Uploaded snap!")
end

Given(/^I have uploaded an image$/) do
  visit new_snap_path
  fill_in "snap[description]", with: "Uploaded snap!"
  attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/second_snap.jpg')
  click_button 'Upload'
end

Then(/^I should see in this order:?$/) do |text|
  if text.is_a?(String)
    lines = text.split(/\n/)
  else
    lines = text.raw.flatten
  end
  lines = lines.collect { |line| line.gsub(/\s+/, '')}.collect(&:strip).reject(&:empty?)
  pattern = lines.collect(&Regexp.method(:quote)).join('.*?')
  pattern = Regexp.compile(pattern)
  page.text.gsub(/\s+/, '').should =~ pattern
end

When(/^someone posts a photo$/) do
  Pusher.url = "http://54588be462ee98f5db66:e51138c2fdbb0e8e0ac7@api.pusherapp.com/apps/67764"
  Pusher.trigger("Snappygram", "new_snap", {
    src: "/system/snaps/images/000/000/001/medium/second_snap.jpg?1394030324", username: "snoopybabe", description: "Pizzaaaaaa"
  })
end

Then(/^I should see the photo$/) do
  expect(page).to have_content('Pizzaaaaaa')
  expect(page).to have_content('snoopybabe')
end

When(/^I am at the home page$/) do
  visit root_path
end

Then(/^I should see my username$/) do
  expect(page).to have_content('snoopybabe')
end



