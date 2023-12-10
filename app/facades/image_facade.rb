class ImageFacade

  def self.get_image
    response = ImageService.new.fetch_image
    parsed = JSON.parse(response.body, symbolize_names: true)
    if response.status == 200
      {
        response: Image.new(parsed[:urls][:raw]),
        status: 200
      }
    else
      {
        response: "No image",
        status: 400
      }
    end
  end
end