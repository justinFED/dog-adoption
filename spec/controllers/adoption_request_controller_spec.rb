require 'rails_helper'

RSpec.describe AdoptionRequestsController, type: :request do
  let(:user) { create(:user, email: "user#{Time.now.to_i}@example.com") }
  let(:dog) { create(:dog) }
  let(:adoption_request) { create(:adoption_request, user: user, dog: dog) }
  
  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all adoption requests as @adoption_requests' do
      adoption_request = create(:adoption_request)
      get adoption_requests_path
      expect(assigns(:adoption_requests)).to eq([adoption_request])
    end
  end

  describe "GET #new" do
    it "renders the new template and initializes a new adoption request" do
      get new_adoption_request_path, params: { dog_id: dog.id }
      expect(response).to be_successful
      expect(assigns(:dog)).to eq(dog)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new AdoptionRequest and redirects to the confirmation page" do
        expect {
          post adoption_requests_path, params: { adoption_request: { occupation: "Developer", adoption_essay: "Love dogs", dog_id: dog.id } }
        }.to change(AdoptionRequest, :count).by(1)
        expect(response).to redirect_to(adoption_application_confirmation_path(dog_id: Dog.last.id))
      end
    end
  end

  describe "GET #confirmation" do
    it "renders the confirmation page for the specified dog" do
      get adoption_application_confirmation_path(dog_id: dog.id)
      expect(response).to be_successful
      expect(assigns(:dog)).to eq(dog)
    end
  end

end
