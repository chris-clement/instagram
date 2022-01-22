require 'rails_helper'

RSpec.feature "Making a post", type: :feature do
  scenario "A user makes a post and it is added to the posts feed" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    attach_file("post[post_photo]", File.join(Rails.root, "/app/assets/images/beach_photo.jpeg" ))
    click_button "Submit"
    expect(page).to have_content("Look at my post over here")
  end
  scenario "A user makes a post and is notified that it has been posted" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    attach_file("post[post_photo]", File.join(Rails.root, "/app/assets/images/beach_photo.jpeg" ))
    click_button "Submit"
    expect(page).to have_content("Thanks for posting")
  end
  
end
