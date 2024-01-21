class CarePerson < ApplicationRecord
  belongs_to :user

  validates :title, length: { maximum: 255 }, presence: true
  validates :body, length: { maximum: 65_535 }, presence: true

  enum sex: { no_enter_sex: 0, male: 1, female: 2 }
  enum care_level: { no_enter_care_level: 0, self: 1, support_1: 11, support_2: 12,
                     care_1: 21, care_2: 22, care_3: 23, care_4: 24, care_5: 25}
end
