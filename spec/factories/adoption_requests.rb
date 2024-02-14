FactoryBot.define do
  factory :adoption_request do
    user # This assumes that you have a user factory defined
    dog
    adoption_essay { "Why I want to adopt this dog" }
    isApproved { false } # Make sure this matches the actual column name in your database
  end
end
