class DogsController < ApplicationController
  before_action :initialize_api, only: [:new, :edit, :create, :update]
  before_action :set_dog, only: [:show, :edit, :update]
  before_action :set_breeds, only: [:new, :edit]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
    @breeds = fetch_dog_breeds
  end

  def edit
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dogs_path, notice: "Dog successfully created"
    else
      set_breeds
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dog.update(dog_params)
      redirect_to dogs_path, notice: 'Dog was successfully updated.'
    else
      set_breeds
      render :edit, status: :unprocessable_entity
    end
  end

  def temperament
    breed_name = params[:breed_name]
    response = fetch_breed_details(breed_name)
  
    if response.present? && response.is_a?(Array) && response.any?
      breed = response.first
      temperament = breed['temperament']
      render json: { temperament: temperament }
    else
      render json: { error: "Breed '#{breed_name}' not found in the API" }, status: :not_found
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  private

  def fetch_breed_details(breed_name)
    response = HTTParty.get("https://api.thedogapi.com/v1/breeds/search?q=#{breed_name}")
    response.parsed_response if response.success? && response.present?
  end

  def fetch_dog_breeds
    response = @api.list_breeds
    JSON.parse(response.body) if response.success?
  rescue StandardError => e
    handle_api_error(e)
    []
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:dog_name, :breed, :description, :age, :gender, :oth_details, :isActive, :picture)
  end

  def initialize_api
    @api = DogApi.new
  end

  def set_breeds
    @breeds = fetch_dog_breeds
  end

  def handle_api_error(error)
    Rails.logger.error "API Error: #{error.message}"
    flash[:error] = "An error occurred while fetching dog breeds. Please try again later."
  end
end
