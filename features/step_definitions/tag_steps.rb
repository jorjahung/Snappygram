Given(/^there are a number of snaps on a number of topics$/) do
  visit new_snap_path
  fill_in "snap[description]", with: "Uploaded snap!"
  attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/first_snap.jpg')
  fill_in "snap[tags]", with: "cat unicorn"
  click_button 'Upload'

  visit new_snap_path
  fill_in "snap[description]", with: "Ooooh, space!"
  attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/third_snap.gif')
  fill_in "snap[tags]", with: "cat space gif"
  click_button 'Upload'

  visit new_snap_path
  fill_in "snap[description]", with: "Not happy"
  attach_file('snap[image]', '/Users/jameshunter/Desktop/snappygram-images/james_cat.gif')
  fill_in "snap[tags]", with: "cat gif"
  click_button 'Upload'
end

When(/^I click on a tag$/) do
  within "li:first-child" do
    click_link 'gif'
  end
end

Then(/^I should see all the snaps with that tag$/) do
  expect(page).to have_content("Ooooh, space!")
  expect(page).to have_content("Not happy")
  expect(page).not_to have_content("Uploaded snap!")
end