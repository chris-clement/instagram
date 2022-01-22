require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  

  describe "POST /" do
    it "redirects to posts" do
      post :index, params: { post: { content: "Hello, world!" } }
      expect(response).to have_http_status(200)
    end

    it "creates a post" do
      post :create, params: { post: { content: "Hello, world!" } }
      expect(Post.find_by(content: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end