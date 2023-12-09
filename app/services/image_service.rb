class ImageService

  def fetch_image
    conn.get("photos/random?query=face") do |req|
      req.params['client_id'] = Rails.application.credentials.unsplash[:client_id]
    end
  end

  private

  def conn
      Faraday.new(url: "https://api.unsplash.com/") do |config|
        config.request :json
      end
  end
end