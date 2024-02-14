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

  describe '#approved_adoption?' do
    let(:dog) { build_stubbed(:dog) }

    context 'when dog is nil' do
      subject { build_stubbed(:adoption_request, dog: nil) }
      it { is_expected.not_to be_approved_adoption }
    end

    context 'when dog is not approved' do
      before { allow(dog).to receive(:is_approved).and_return(false) }
      subject { build_stubbed(:adoption_request, dog: dog) }
      it { is_expected.not_to be_approved_adoption }
    end

    context 'when dog exists and is approved' do
      before { allow(dog).to receive(:is_approved).and_return(true) }
      subject { build_stubbed(:adoption_request, dog: dog) }
      it { is_expected.to be_approved_adoption }
    end
  end

end
