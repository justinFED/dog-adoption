class User < ApplicationRecord
  enum role: { user: 0, admin: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  private

  def assign_default_role
    update(role: :user) if role.nil?
  end
end
