require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:admin_user){FactoryBot.create(:admin_user)}
  let!(:guest_user){FactoryBot.create(:guest_user)}
  let!(:guest_admin_user){FactoryBot.create(:guest_admin_user)}
  
  describe 'ユーザ登録機能' do 
    context '管理者がユーザを新規登録した場合' do
      it '新規登録ができる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'admin@example.com'
        fill_in 'user_password', with: 'adminpassword'
        click_button 'commit'
        click_link 'アカウント登録'
        fill_in 'user_name', with: 'nakano'
        fill_in 'user_email', with: 'nakano@test.com'
        fill_in 'user_password', with: 'nakanotest'
        fill_in 'user_password_confirmation', with: 'nakanotest'
        click_on 'commit'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
    context '一般ユーザがユーザ新規登録画面に遷移しようとした場合' do
      it 'ユーザ一覧が表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'general@example.com'
        fill_in 'user_password', with: 'testpassword'
        click_button 'commit'
        visit new_user_registration_path
        expect(current_path).to eq users_path
      end
    end
    context 'ログイン前のユーザがユーザ新規登録画面に遷移しようとした場合' do
      it 'ログイン画面に遷移する' do
        visit new_user_registration_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end
  
  describe 'セッション機能' do
    context 'ユーザがログインせずユーザ一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移する' do
        visit users_path
        expect(current_path).to eq new_user_session_path
      end
    end
    context '一般ユーザがログインした場合' do
      it 'ログインができる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'general@example.com'
        fill_in 'user_password', with: 'testpassword'
        click_button 'commit'
        expect(current_path).to eq users_path
      end
    end
    context 'ゲストユーザがログインした場合' do
      it 'ログインができる' do
        visit root_path
        click_on 'ゲストログイン（閲覧用）'
        expect(current_path).to eq users_path
      end
    end
    context '管理者ゲストユーザがログインした場合' do
      it 'ログインができる' do
        visit root_path
        click_on '管理者ゲストログイン（閲覧用）'
        expect(current_path).to eq users_path
      end
    end
  end

  describe '管理者画面機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'admin@example.com'
      fill_in 'user_password', with: 'adminpassword'
      click_button 'commit'
    end
    context '管理者ユーザの場合' do
      it '管理画面に遷移できる' do
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
      end
    end
  end

end