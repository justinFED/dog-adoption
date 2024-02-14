require 'rails_helper'

RSpec.describe AdoptionRequest, type: :model do

  # Associations test
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:dog) }
  end

  # Attributes test
  describe 'attributes' do
    it 'has an adoption_essay attribute' do
      adoption_request = AdoptionRequest.new(adoption_essay: 'My adoption essay')
      expect(adoption_request.adoption_essay).to eq('My adoption essay')
    end
  end

  # Methods tests
  describe '#pending?' do
    context 'when the adoption request is not approved' do
      subject { build(:adoption_request, isApproved: false) }
      it { is_expected.to be_pending }
    end

    context 'when the adoption request is approved' do
      subject { build(:adoption_request, isApproved: true) }
      it { is_expected.not_to be_pending }
    end
  end

  describe '#pending?' do
    let(:user) { create(:user) }
    let(:dog) { create(:dog) }
    context 'when the adoption request is not approved' do
      let(:adoption_request) { create(:adoption_request, user: user, dog: dog, isApproved: false) }

      it 'is pending' do
        expect(adoption_request.pending?).to eq(true)
      end
    end

    context 'when the adoption request is approved' do
      let(:adoption_request) { create(:adoption_request, user: user, dog: dog, isApproved: true) }

      it 'is not pending' do
        expect(adoption_request.pending?).to eq(false)
      end
    end
  end
end
