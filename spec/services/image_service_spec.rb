require 'rails_helper'

RSpec.describe ImageService do 
  it "exists" do 
    service = ImageService.new

    expect(service).to be_an(ImageService)
  end

  describe "instance methods", :vcr do 
    it "#fetch_image" do 
      service = ImageService.new
      response = service.fetch_image
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:urls)
      expect(parsed[:urls]).to have_key(:raw)
    end
  end
end