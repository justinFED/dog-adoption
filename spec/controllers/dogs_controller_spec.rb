require 'rails_helper'
require 'webmock/rspec'
require_relative '../../app/api/dog_api'

RSpec.describe DogsController, type: :request do
  let(:dog) { create(:dog) } 

	before do
		stub_request(:get, "https://api.thedogapi.com/v1/breeds")
			.with(
				headers: {
					'Accept'=>'application/json',
					'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
					'Content-Type'=>'application/json',
					'User-Agent'=>'Ruby',
					'X-Api-Key'=> 'live_iVeNL5naj6yQlZeUr4zxav6cKp6T0UenMX1q2GEMYnJS2m6fntJzB4Cib6SE2kaj'
				}
			)
			.to_return(status: 200, body: '[]', headers: {})

			stub_request(:get, "https://api.thedogapi.com/v1/breeds/search?q=Labrador")
			.with(
				headers: {
					'Accept'=>'*/*',
					'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
					'User-Agent'=>'Ruby'
				}
			)
			.to_return(status: 200, body: '[{"temperament": "Gentle, Intelligent, Family-friendly"}]', headers: {})

			stub_request(:get, "https://api.thedogapi.com/v1/breeds/search?q=Golden%20Retriever")
      .to_return(status: 200, body: '[{"temperament": "Friendly, Intelligent, Devoted"}]', headers: {})
	end

  describe "GET #index" do
    it "assigns all dogs as @dogs and renders the index template" do
			dog = create(:dog)
      get dogs_path
      expect(assigns(:dogs)).to eq([dog])
    end
  end

  describe "GET #show" do
    it "assigns the requested dog as @dog" do
      get show_dog_path(dog), params: { id: dog.id }
      expect(assigns(:dog)).to eq(dog)
    end
  end

  describe "GET #index" do
		it "assigns all dogs as @dogs and renders the index template" do
			stub_request(:get, /https:\/\/api.thedogapi.com\/v1\/breeds\/search\?q=.*/)
				.to_return(status: 200, body: '[{"temperament": "Intelligent, Friendly, Reliable"}]', headers: {})

			get dogs_path
			expect(response).to be_successful
		end
	end

  describe "GET #edit" do
    it "assigns the requested dog as @dog for editing" do
      get edit_dog_path(dog), params: { id: dog.id }
      expect(assigns(:dog)).to eq(dog)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { { dog_name: "Rex", breed: "Labrador", age: 5 } }

      it "creates a new Dog and redirects to the index page with a notice" do
        expect {
          post dogs_path, params: { dog: valid_attributes }
        }.to change(Dog, :count).by(1)
        expect(response).to redirect_to(dogs_path)
        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { dog_name: "", breed: "", age: nil } }

      it "does not create a new Dog and re-renders the new template" do
        expect {
          post dogs_path, params: { dog: invalid_attributes }
        }.not_to change(Dog, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) { { dog_name: "Max", breed: "Golden Retriever" } }

    it "updates the requested dog and redirects to the index page" do
      put dog_path(dog), params: { id: dog.id, dog: new_attributes }
      dog.reload
      expect(dog.dog_name).to eq("Max")
      expect(response).to redirect_to(dogs_path)
    end
  end

end
