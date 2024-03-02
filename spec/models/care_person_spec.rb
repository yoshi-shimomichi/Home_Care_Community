require 'rails_helper'

RSpec.describe CarePerson, type: :model do
  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      care_person = build(:care_person)
      expect(care_person).to be_valid
    end
  end

  context '年齢に数値以外が含まれる場合' do
    it '無効であること' do
      care_person = build(:care_person, age: '70a')
      expect(care_person).to be_invalid
      expect(care_person.errors[:age]).to include("は数値で入力してください")
    end
  end

end
