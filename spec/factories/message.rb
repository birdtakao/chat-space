FactoryGirl.define do
  factory :message do
    text            { Faker::Lorem.sentence }
    group       { create(:group) }
    user        { create(:user) }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
    image     File.open(File.join(Rails.root, '/spec/fixtures/img/sample.jpg'))
  end
end
