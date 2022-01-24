require 'rails_helper'

RSpec.feature "Filtering the posts page", type: :feature do
  scenario "A user can view all posts with a specific hashtag" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    fill_in "post[hashtags]", with: "#beach#sun"
    attach_file("post[post_photo]", File.join(Rails.root, "/app/assets/images/beach_photo.jpeg" ))
    click_button "Submit"
    visit "/"
    fill_in "hashtags_filter", with: "dogs"
    click_button "Filter"
    expect(page).to_not have_content("Look at my post over here")
  end
end
