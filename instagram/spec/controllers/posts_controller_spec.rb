require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  

  describe "POST /" do
    it "redirects to posts" do
      post :index, params: { post: { content: "Hello, world!" } }
      expect(response).to have_http_status(200)
    end

    it "creates a post" do
      # Maybe add something here
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
