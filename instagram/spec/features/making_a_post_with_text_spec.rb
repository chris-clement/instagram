require 'rails_helper'

RSpec.feature "Making a post", type: :feature do
  scenario "A user makes a post without a photo and is given a warning" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    click_button "Submit"
    expect(page).to have_content("Instagram requires you have a photo with each post. Try again.")
  end
end
