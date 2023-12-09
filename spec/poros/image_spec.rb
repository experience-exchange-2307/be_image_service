require 'rails_helper'

RSpec.describe Image do 
  describe "intialize" do 
    it "exists" do
      image_url = "www.imagelink/image" 
      image = Image.new(image_url)

      expect(image).to be_an(Image)
      expect(image.raw_image).to eq(image_url)
    end
  end
end