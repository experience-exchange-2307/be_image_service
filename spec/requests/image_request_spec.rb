require 'rails_helper'

RSpec.describe "get image from unsplash", type: :request do
  describe "GET 'api/v1/images", :vcr do 
    it "returns an image from the unsplash API" do 
      get "/api/v1/images"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body).to have_key(:data)
      expect(response_body[:data]).to have_key(:attributes)

      attributes = response_body[:data][:attributes]

      expect(attributes).to have_key(:raw_image)
    end
  end
end