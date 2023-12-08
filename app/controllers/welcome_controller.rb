class WelcomeController < ApplicationController
  def index
    render json: {"success": "hello :)"}
  end
end