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
end
