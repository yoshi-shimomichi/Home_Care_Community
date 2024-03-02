FactoryBot.define do
    factory :post do
      sequence(:body) { |n| "本文#{n}" }
      post_type { :question }
      association :user
    end

    trait :question do
        post_type { :question }
      end
    
      trait :tweet do
        post_type { :tweet }
      end
  end
  