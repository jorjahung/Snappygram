Given(/^there are images$/) do
  @first_snap = Snap.new(description: "Our first snap")
  @first_snap.image = File.open('/Users/jameshunter/Desktop/snappygram-images/first_snap.jpg')
  @first_snap.save
end

Given(/^there are pages of snaps uploaded$/) do
  visit new_snap_path
  fill_in "snap[description]", with: "Second page!"
  attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/first_snap.jpg')
  fill_in "snap[tags]", with: "cat unicorn"
  click_button 'Upload'
  10.times do
    visit new_snap_path
    fill_in "snap[description]", with: "Uploaded snap!"
    attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/first_snap.jpg')
    fill_in "snap[tags]", with: "cat unicorn"
    click_button 'Upload'
  end
end

Given(/^I (?:am |)(?:at|on|visit) the homepage$/) do
  visit root_path
end

Given(/^I am on the new snap page$/) do
  visit new_snap_path
end

Given(/^I am the page of a snap I want to buy$/) do
  visit snap_path(@first_snap)
end

Given(/^I have uploaded an image$/) do
  visit new_snap_path
  fill_in "snap[description]", with: "Uploaded snap!"
  attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/second_snap.jpg')
  click_button 'Upload'
end



When(/^I upload an image$/) do
  fill_in "snap[description]", with: "Uploaded snap!"
  attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/second_snap.jpg')
  click_button 'Upload'
end

When(/^someone posts a photo$/) do
  Pusher.url = "http://1460f55072d4b5c355e8:efe1c68aa43b5f454d4d@api.pusherapp.com/apps/67907"
  Pusher.trigger("Snappygram", "new_snap", {
    src: "/system/snaps/images/000/000/001/medium/second_snap.jpg?1394030324", username: "snoopybabe", tags: ["cat"], description: "Pizzaaaaaa"
  })
end

When(/^I am at the home page$/) do
  visit root_path
end

When(/^I submit a photo with tags$/) do
  fill_in "snap[description]", with: "It's a cat!"
  attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/second_snap.jpg')
  fill_in "snap[tags]", with: "Catatat"
  click_button 'Upload'
end

When(/^I click on the first image$/) do
  within("#snaps-container") do
    find(".image-link").click
  end
end

When(/^I click the buy button$/) do
  click_button 'Buy'
end

Then(/^I should see the photo$/) do
  expect(page).to have_content('Pizzaaaaaa')
  expect(page).to have_content('snoopybabe')
end

Then(/^I should see the page for that image$/) do
  expect(current_path).to eq(snap_path(@first_snap))
end

Then(/^I should see snaps$/) do
  expect(page).to have_xpath("//img[contains(@src, 'first_snap.jpg')]")
  expect(page).to have_content("Our first snap")
end

Then(/^I should see the tags in the homepage$/) do
  expect(page).to have_content('Catatat')
end

Then(/^I should only see (\d+) snaps$/) do |arg1|
  expect(page).not_to have_content("Second page!")
end

Then(/^I should see my username$/) do
  expect(page).to have_content('snoopybabe')
end

Then(/^I should see that snap on the homepage$/) do
  expect(page).to have_xpath("//img[contains(@src, 'second_snap.jpg')]")
  expect(page).to have_content("Uploaded snap!")
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
  expect(page.text.gsub(/\s+/, '')).to match(pattern)
end
