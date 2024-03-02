FactoryBot.define do
    factory :comment_favorite do
      association :user
      association :comment
    end
  end
  