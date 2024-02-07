class DogsController < ApplicationController
  before_action :initialize_api, only: [:breeds, :image_details, :new] 


  def index
    @dogs = Dog.all
  end

  def show
    
  end

  def new
    @dog = Dog.new
    @breeds = breeds
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      flash[:success] = "Object successfully created"
      redirect_to @dog
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def temperament
    breed_name = params[:breed_name]
    breed_data = fetch_breed_data(params[:id]) # Assuming fetch_breed_data method exists
    temperament = breed_data["temperament"]
    render json: { temperament: temperament }
  end

  def breeds
    handle_api_error do
      @response = @api.list_breeds
      # @breed_data = fetch_breed_data(params[:id])
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
    params.require(:dog).permit(:dog_name, :breed, :description, :age, :gender, :oth_details, :isActive, :picture)
  end

  def fetch_breed_data(breed_id)
    breed = Breed.find(breed_id)
    breed.attributes
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
