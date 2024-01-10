class ImageFacade

  def self.get_image
    response = ImageService.new.fetch_image

    if response.status == 200
      parsed = JSON.parse(response.body, symbolize_names: true)
      {
        response: Image.new(parsed[:urls][:raw]),
        status: 200
      }
    elsif response.status == 429
      {
        error: "Rate limit reached (50 requests/hr)",
        status: 429
      }
    elsif response.status == 503
      {
        error: "External API is down",
        status: 503
      }
    else
      {
        error: "Something went wrong",
        status: response.status
      }
    end
  end
end