class DogsController < ApplicationController
  before_action :initialize_api, only: [:breeds, :image_details]

  def index
    
  end

  def show
    
  end

  def breeds
    handle_api_error do
      @breeds = @api.list_breeds
      render json: @breeds
    end
  end
  
  def image_details
    handle_api_error do
      @dog_image_details = @api.fetch_image_details(params[:image_id])
      render json: @dog_image_details
    end
  end

  private

  def initialize_api
    @api = DogApi.new
  end

  def handle_api_error
    yield
  rescue StandardError => e
    error_message = "Error Message: #{e.message}"
    render html: "<div style='color: red;'>#{error_message}</div>".html_safe, status: :unprocessable_entity
  end

end
