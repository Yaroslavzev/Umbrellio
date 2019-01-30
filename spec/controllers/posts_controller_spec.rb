require 'rails_helper'

describe PostsController do
  describe "GET 'posts'" do
    let(:post_params) { {post: { title: "Test", body: "Test", ip: IPAddr.new("55.245.90.102"), user_id: "1"}} }

    it "is a success(200)" do
      expect(post :create, params: post_params).to have_http_status(:ok)
    end

    it "isn't a success(422)" do
      expect(post :create, params: {post: {title: ""}}).to have_http_status(:unprocessable_entity)
    end
  end
end
