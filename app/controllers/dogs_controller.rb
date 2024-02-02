class DogsController < ApplicationController
  def index
    api = DogApi.new
    @breeds = api.list_breeds
    
  end

  def show
    api = DogApi.new
    @dog_image_details = api.fetch_image_details(params[:image_id])
  end
end