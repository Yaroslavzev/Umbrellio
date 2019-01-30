require 'rails_helper'

describe RatesController do
  let(:rate_params) { { value: 3, id: 3, amount: 3 } }

  describe "GET 'get_ip'" do
    before(:example) {get :get_ip}

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST 'rates'" do
      it "is a success(200)" do
      expect(post :create, params: rate_params).to have_http_status(:ok)
    end

    it "isn't a success(422)" do
      expect(post :create).to have_http_status(:unprocessable_entity)
    end
  end

  describe "POST 'rates/top_amount'" do
    it "is a success(200)" do
      expect(post :top_amount, params: rate_params).to have_http_status(:ok)
    end

    it "isn't a success(422)" do
      expect(post :top_amount).to have_http_status(:unprocessable_entity)
    end
  end
end
