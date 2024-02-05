class AdoptionRequest < ApplicationRecord
  belongs_to :user
  belongs_to :dog
end
