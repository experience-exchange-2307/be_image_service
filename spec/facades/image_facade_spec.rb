require 'rails_helper'

RSpec.describe ImageFacade do 
  it "exists" do 
    facade = ImageFacade.new

    expect(facade).to be_an(ImageFacade)
  end
  
  describe "class methods", :vcr do 
    it "#get_image" do 
      image = ImageFacade.get_image
      
      expect(image).to be_an(Image)
      expect(image.raw_image).to eq("https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixid=M3w1MjcwODR8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDIwOTMzODF8&ixlib=rb-4.0.3")
    end
  end
end