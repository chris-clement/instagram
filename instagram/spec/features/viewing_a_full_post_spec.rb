require 'rails_helper'

RSpec.feature "Viewing a full post", type: :feature do
  scenario "A user can view full details of a post" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    click_button "Submit"
    visit "/"
    click_link "Full Post"
    expect(page).to have_content("Image Placeholder")
  end
  scenario "A user makes a post and a timestamp is shown of when it was posted in the full post details" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    click_button "Submit"
    visit "/"
    click_link "Full Post"
    date_now = Date.new()
    expect(page).to have_content(Time.now.strftime("%d-%m-%Y @ %H:%M"))
  end
end
