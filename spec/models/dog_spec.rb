require 'rails_helper'

RSpec.describe Dog, type: :model do
    describe 'associations' do
        it { is_expected.to have_many(:adoption_requests) }
        it { is_expected.to have_one_attached(:picture) }
      end

      describe '#temperament' do
        it 'allows reading and writing for :temperament' do
          dog = Dog.new
          dog.temperament = 'Friendly'
          expect(dog.temperament).to eq('Friendly')
        end
      end
end
