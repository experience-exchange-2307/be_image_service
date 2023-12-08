class Api::V1::ImagesController < ApplicationController
  def index
    conn = Faraday.new(
      url: "https://api.unsplash.com",
      params: { client_id: Rails.application.credentials.unsplash[:client_id] }
    )

    response = conn.get("/photos/random?query=face")
    parsed = JSON.parse(response.body, symbolize_names: true)
    if parsed[:urls][:raw]
      image = parsed[:urls][:raw]
      render json: image
    else
      render json: {error: "could not retrieve a random image"}, status: 400
    end
  end
end