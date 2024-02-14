FactoryBot.define do
  factory :adoption_request do
    user { create(:user) }
    dog { create(:dog) }
    adoption_essay { "Why I want to adopt this dog" }
    isApproved { false } 
  end
end
