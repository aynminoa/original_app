require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  
  describe 'ユーザ登録機能' do 
    context 'ユーザを新規登録した場合' do
      it '新規登録ができる' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'nakano'
        fill_in 'user_email', with: 'nakano@test.com'
        fill_in 'user_password', with: 'nakanotest'
        fill_in 'user_password_confirmation', with: 'nakanotest'
        click_on 'commit'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  # let!(:user){FactoryBot.create(:user)}
  # let!(:admin_user){FactoryBot.create(:admin_user)}

end