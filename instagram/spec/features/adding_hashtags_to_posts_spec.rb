require 'rails_helper'

RSpec.feature "Making a post with hashtags", type: :feature do
  scenario "A user makes a post with hashtags, this is shown on full post details" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    attach_file("post[post_photo]", File.join(Rails.root, "/app/assets/images/beach_photo.jpeg" ))
    fill_in "post[hashtags]", with: "#summer#beach"
    click_button "Submit"
    click_link "Full Post"
    expect(page).to have_content("#summer #beach")
  end
  scenario "A user makes a post without hashtags, this is still shown on full post details" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    attach_file("post[post_photo]", File.join(Rails.root, "/app/assets/images/beach_photo.jpeg" ))
    click_button "Submit"
    expect(page).to have_content("Thanks for posting")
  end
  
end
