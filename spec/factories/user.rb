FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "user_#{n}@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
      sequence(:name) { |n| "user_name_#{n}" }
    end
  end
  