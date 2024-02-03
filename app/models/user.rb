class User < ApplicationRecord
  attribute :role, :integer, default: 0
  enum role: { user: 0, admin: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
end
