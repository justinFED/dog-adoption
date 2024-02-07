class DogsController < ApplicationController
  before_action :initialize_api, only: [:new, :edit, :create, :update]
  before_action :set_dog, only: [:show, :edit, :update, :breeds]
  before_action :set_breeds, only: [:breeds, :new, :edit, :breeds]

  def index
    @dogs = Dog.all
  end

  def show; end

  def new
    @dog = Dog.new
  end

  def edit; end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dogs_path, notice: "Dog successfully created"
    else
      set_breeds # Reload breeds for rendering the form again
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dog.update(dog_params)
      redirect_to dogs_path, notice: 'Dog was successfully updated.'
    else
      set_breeds # Reload breeds for rendering the form again
      render :edit, status: :unprocessable_entity
    end
  end

  def temperament
    breed_data = fetch_breed_data(params[:id])
    render json: { temperament: breed_data["temperament"] }
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def breeds
    @breeds ||= handle_api_error { JSON.parse(@api.list_breeds.body) }
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:dog_name, :breed, :description, :age, :gender, :oth_details, :isActive, :picture)
  end

  def fetch_breed_data(breed_id)
    Breed.find(breed_id).attributes
  end

  def initialize_api
    @api = DogApi.new
  end

  def set_breeds
    breeds
  rescue => e
    flash[:error] = "Failed to load breeds: #{e.message}"
    @breeds = []
  end

  

  def handle_api_error
    yield
  rescue StandardError => e
    Rails.logger.error "API Error: #{e.message}"
    nil # Return nil or a default value that calling methods can handle
  end
end
