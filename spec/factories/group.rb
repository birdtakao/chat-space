FactoryGirl.define do
  factory :group do
     name       { Faker::Team.name }
     created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
     updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
