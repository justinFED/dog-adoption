class DogsController < ApplicationController
  before_action :initialize_api, only: [:breeds, :image_details, :new] 


  def index
    
  end

  def show
    
  end

  def new
    @dog = Dog.new
    @breeds = breeds
  end

  def temperament
    breed = Breed.find_by(name: params[:breed_name])
    if breed
      render json: { temperament: breed.temperament }
    else
      render json: { error: "Breed not found" }, status: :not_found
    end
  end
  

  def breeds
    handle_api_error do
      @response = @api.list_breeds
      # Ensure to use @response here since that's the variable you've assigned
      @breeds = JSON.parse(@response.body) if @response.code.between?(200, 299)
    end
  end
  
  def image_details
    handle_api_error do
      @dog_image_details = @api.fetch_image_details(params[:image_id])
      render json: @dog_image_details
    end
  end

  private
  
  def dog_params
    params.require(:dog).permit(:dog_name, :breed, :description, :age, :gender, :other_details, :is_active, :picture)
  end

  def initialize_api
    @api = DogApi.new
  end

  def handle_api_error
    begin
      yield
    rescue StandardError => e
      Rails.logger.error "API Error in DogsController: #{e.message}"
      render json: { error: "Error Message: #{e.message}" }, status: :unprocessable_entity
    end
  end

end
