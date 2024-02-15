require 'rails_helper'

RSpec.describe DogsController, type: :request do
  let(:dog) { create(:dog) } 

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

  describe "GET #new" do
    it "assigns a new dog as @dog and fetches breeds" do
      # Assuming `fetch_dog_breeds` is stubbed to return a mock response
      get new_dog_path
      expect(assigns(:dog)).to be_a_new(Dog)
      expect(assigns(:breeds)).not_to be_empty
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
