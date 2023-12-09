class ImageFacade

  def self.get_image
    response = ImageService.new.fetch_image
    parsed = JSON.parse(response.body, symbolize_names: true)
    Image.new(parsed[:urls][:raw])
  end
  
end