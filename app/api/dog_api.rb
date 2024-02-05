require 'httparty'

class DogApi
  include HTTParty
  base_uri 'https://api.thedogapi.com/v1'

  def initialize
    @options = { headers: { "x-api-key" => ENV['DOG_API_KEY'] } }
  end

  # Fetch a list of breeds
  def list_breeds
    handle_request_errors do
      self.class.get("/breeds", @options)
    end
  end

  # Fetch details about a specific breed
  def breed_details(breed_id)
    handle_request_errors do
      self.class.get("/breeds/#{breed_id}", @options)
    end
  end

  def fetch_image_details(image_id)
    handle_request_errors do
      self.class.get("/images/#{image_id}", @options)
    end
  end

  private

  def handle_request_errors
    begin
      response = yield
      if response.success?
        return response
      else
        raise "Status code #{response.code}: #{response.message}"
      end
    rescue StandardError => e
      raise "#{e.message}"
    end
  end
end
