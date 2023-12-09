class Api::V1::ImagesController < ApplicationController
  def index
    image = ImageFacade.get_image
    if image
      render json: ImageSerializer.new(image), status: 200
    else
      render json: {error: "image could not be found"}
    end 
  end
end