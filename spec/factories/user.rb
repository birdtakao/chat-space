FactoryGirl.define do
  factory :user do
     id         1
     name       "テスト"
     email      "test@test.com"
     password    "12345678"
     password_confirmation    "12345678"
  end
end
