FactoryGirl.define do
  factory :message do
    text            Faker::Lorem.sentence
    group_id        1
    user_id         1
    image     File.open(File.join(Rails.root, '/spec/fixtures/img/sample.jpg'))
  end
end
