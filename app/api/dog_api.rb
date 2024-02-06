require 'httparty'

class DogApi
  include HTTParty
  base_uri 'https://api.thedogapi.com/v1'

  def initialize
    @options = { headers: { "x-api-key" => ENV['DOG_API_KEY'] } }
  end

  # Fetch a list of breeds
  def list_breeds
    self.class.get("/breeds", @options)
  end

  # Fetch details about a specific breed
  def breed_details(breed_id)
    self.class.get("/breeds/#{breed_id}", @options)
  end

  def fetch_image_details(image_id)
    self.class.get("/images/#{image_id}", @options)
  end

  def fetch_random_images
    self.class.get("/images/search?limit=9", @options)
  end
  

end