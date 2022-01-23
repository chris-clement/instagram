require 'rails_helper'

RSpec.feature "Editing a post", type: :feature do
  scenario "A user makes a post and it is added to the posts feed" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over hererrrr"
    attach_file("post[post_photo]", File.join(Rails.root, "/app/assets/images/beach_photo.jpeg" ))
    click_button "Submit"
    click_link "Edit"
    fill_in "post[content]", with: "Look at my updated post"
    click_button "Submit"
    expect(page).to have_content "Look at my updated post"
  end
  scenario "Posts which have been edited show up with (Edited)" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over hererrrr"
    attach_file("post[post_photo]", File.join(Rails.root, "/app/assets/images/beach_photo.jpeg" ))
    click_button "Submit"
    click_link "Edit"
    fill_in "post[content]", with: "Look at my updated post"
    attach_file("post[post_photo]", File.join(Rails.root, "/app/assets/images/beach_photo.jpeg" ))
    click_button "Submit"
    expect(page).to have_content "Look at my updated post (Edited)"
  end
  scenario "Posts which have not been edited don't have (Edited)" do
    visit "/"
    click_link "Create new post"
    fill_in "post[content]", with: "Look at my post over here"
    attach_file("post[post_photo]", File.join(Rails.root, "/app/assets/images/beach_photo.jpeg" ))
    click_button "Submit"
    expect(page).not_to have_content "(Edited)"
  end
end
