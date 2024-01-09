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

  describe "failed response forwarding" do
    it "forwards a 429 error" do
      stub_request(:any, "https://api.unsplash.com/photos/random?client_id=#{Rails.application.credentials.unsplash[:client_id]}&query=face").
        to_return(status: 429)
      get "/api/v1/images"

      expect(response).to_not be_successful
      expect(response.status).to eq(429)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body).to have_key(:error)
      expect(response_body[:error]).to eq("Rate limit reached (50 requests/hr)")
    end

    it "forwards a 503 error" do
      stub_request(:any, "https://api.unsplash.com/photos/random?client_id=#{Rails.application.credentials.unsplash[:client_id]}&query=face").
        to_return(status: 503)
      get "/api/v1/images"

      expect(response).to_not be_successful
      expect(response.status).to eq(503)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body).to have_key(:error)
      expect(response_body[:error]).to eq("External API is down")
    end

    it "forwards the API's error if the error is unknown" do
      stub_request(:any, "https://api.unsplash.com/photos/random?client_id=#{Rails.application.credentials.unsplash[:client_id]}&query=face").
        to_return(status: 500)
      get "/api/v1/images"

      expect(response).to_not be_successful
      expect(response.status).to eq(500)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body).to have_key(:error)
      expect(response_body[:error]).to eq("Something went wrong")
    end
  end
end