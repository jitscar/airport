FactoryGirl.define do
  factory :plane do
    flight { Faker::Flight.number }
  end
end
