class Dog < ApplicationRecord
  has_many :adoption_requests
  has_one_attached :picture

  validates :dog_name, presence: true
  validates :breed, presence: true
  
  attr_accessor :temperament
end
