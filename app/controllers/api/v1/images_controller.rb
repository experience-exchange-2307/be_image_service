class Api::V1::ImagesController < ApplicationController
  def index
    image = ImageFacade.get_image
    if image[:status] == 200
      render json: ImageSerializer.new(image[:response]), status: 200
    else
      render json: image, status: image[:status]
    end 
  end
end