class User < ApplicationRecord
  enum role: { user: 0, admin: 1 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role
  
  has_many :adoption_requests, dependent: :destroy

  def adopted_dog
    adoption_request = AdoptionRequest.find_by(user_id: self.id, isApproved: true)
    adoption_request&.dog
  end

  def approved_adoption?
    self.adoption_requests.exists?(isApproved: true)
  end

  def pending_adoption?
    self.adoption_requests.exists?(isApproved: false)
  end
  
  private

  def assign_default_role
    update(role: :user) if role.nil?
  end
end
