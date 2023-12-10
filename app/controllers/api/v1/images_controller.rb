class Api::V1::ImagesController < ApplicationController
  def index
    image = ImageFacade.get_image
    if image[:status] == 200
      render json: ImageSerializer.new(image[:response]), status: 200
    else
      render json: {error: "image could not be found"}, status: 404
    end 
  end
end