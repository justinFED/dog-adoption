FactoryBot.define do
  factory :dog do
    # Assume Dog has attributes like name, breed, etc.
    name { "Rex" }
    breed { "Labrador" }
    is_approved { false } # Assuming this is the correct attribute name based on your error message
  end
end
  