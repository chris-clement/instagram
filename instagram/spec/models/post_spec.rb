require 'rails_helper'

RSpec.describe Post, type: :model do
  it "Saves posts to the database" do 
    Post.create(content: "My insta post")
    expect(Post.find_by(content: "My insta post")).to be 
  end
end
