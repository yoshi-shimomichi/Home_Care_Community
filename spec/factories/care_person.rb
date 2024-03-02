FactoryBot.define do
    factory :care_person do
      age { 70 }
      sex { :male }
      care_level { :self }
      bio { "" }
      association :user
    end
  end
  