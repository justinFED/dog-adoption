class Dog < ApplicationRecord
  has_many :adoption_requests
  has_one_attached :picture

  attr_accessor :temperament
end
