require 'rails_helper'

RSpec.feature "Making a post", type: :feature do
  scenario "A user makes a post and it is added to the posts feed" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    click_button "Submit"
    expect(page).to have_content("Look at my post over here")
  end
end
