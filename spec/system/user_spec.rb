require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        xit 'ユーザーの新規作成が成功する' do
          visit new_user_path
          expect {
            fill_in 'ユーザー名', with: 'らんてくん'
            fill_in 'メールアドレス', with: 'example@example.com'
            fill_in 'パスワード', with: 'password'
            fill_in 'パスワード確認', with: 'password'
            click_button '登録'
            Capybara.assert_current_path("/", ignore_query: true)
          }.to change { User.count }.by(1)
          expect(page).to have_content('ユーザー登録が完了しました'), 'フラッシュメッセージ「ユーザー登録が完了しました」が表示されていません'
        end

        xit 'ユーザーの新規作成が成功する' do
            visit new_user_path
              fill_in 'ユーザー名', with: 'らんてくん'
              fill_in 'メールアドレス', with: 'example@example.com'
              fill_in 'パスワード', with: 'password'
              fill_in 'パスワード確認', with: 'password'
              click_button '登録'
            expect(page).to have_content('ユーザー登録が完了しました'), 'フラッシュメッセージ「ユーザー登録が完了しました」が表示されていません'
          end
      end
    end

  end
end