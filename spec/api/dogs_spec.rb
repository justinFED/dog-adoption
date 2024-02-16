require 'rails_helper'
require 'webmock/rspec'
require_relative '../../app/api/dog_api' # Update this path to where your DogApi class is located

RSpec.describe DogApi do
  describe '#list_breeds' do
    it 'makes a GET request to the correct endpoint' do
      stub_request(:get, "https://api.thedogapi.com/v1/breeds")
        .with(headers: {'x-api-key' => ENV['DOG_API_KEY']})
        .to_return(status: 200, body: "[]", headers: {})

      api = DogApi.new
      api.list_breeds

      expect(WebMock).to have_requested(:get, "https://api.thedogapi.com/v1/breeds")
      .with(headers: {'x-api-key' => ENV['DOG_API_KEY']})
    end
  end

  describe '#breed_details' do
    it 'makes a GET request to the correct endpoint with breed ID' do
      breed_id = '123'
      stub_request(:get, "https://api.thedogapi.com/v1/breeds/#{breed_id}")
        .with(headers: {'x-api-key' => ENV['DOG_API_KEY']})
        .to_return(status: 200, body: "{}", headers: {})

      api = DogApi.new
      api.breed_details(breed_id)

      expect(WebMock).to have_requested(:get, "https://api.thedogapi.com/v1/breeds/#{breed_id}")
    end
  end

  describe '#fetch_image_details' do
    it 'makes a GET request to the correct endpoint with image ID' do
      image_id = '-HgpNnGXl'
      stub_request(:get, "https://api.thedogapi.com/v1/images/#{image_id}")
        .with(headers: {'x-api-key' => ENV['DOG_API_KEY']})
        .to_return(status: 200, body: "{}", headers: {})

      api = DogApi.new
      api.fetch_image_details(image_id)

      expect(WebMock).to have_requested(:get, "https://api.thedogapi.com/v1/images/#{image_id}")
    end
  end
end
