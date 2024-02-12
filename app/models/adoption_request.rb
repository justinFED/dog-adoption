class AdoptionRequest < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  # Add the adoption_essay attribute
  attribute :adoption_essay, :text 
  def pending?
    !isApproved
  end

  def approved_adoption?
    !dog.nil? && dog.isApproved
  end
end
