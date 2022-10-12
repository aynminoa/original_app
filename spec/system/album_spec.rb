require 'rails_helper'
RSpec.describe 'アルバム管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:album) { FactoryBot.create(:album, user: user) }
  let!(:second_album) { FactoryBot.create(:second_album, user: user) }
  let!(:third_album) { FactoryBot.create(:third_album, user: user) }
  
  describe 'CRUD機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'general@example.com'
      fill_in 'user_password', with: 'testpassword'
      click_button 'commit'
    end
    context '（新規作成機能）マイページからアルバムを新規作成した場合' do
      it '作成したアルバムが表示される' do
        visit user_path(user.id)
        fill_in 'album_title', with: '台湾'
        select '2022', from: 'album_visited_on_1i'
        select '10月', from: 'album_visited_on_2i'
        click_button 'commit'
        expect(page).to have_content 'test_generalさんの台湾旅行'
      end
    end
    context '（詳細表示機能）マイページで任意のアルバムを選択した場合' do
      it 'そのアルバムの内容が表示される' do
        visit user_path(user.id)
        click_link '台湾'
        expect(page).to have_content 'test_generalさんの台湾旅行'
      end
    end
    context '（編集機能）任意のアルバムを編集した場合' do
      it '変更した内容がマイページに反映されている' do
        visit user_path(user.id)
        click_link '台湾'
        click_link 'アルバムを編集'
        fill_in 'album_title', with: '台北'
        click_button 'commit'
        expect(page).to have_content '台北'
      end
    end
    context '（削除機能）任意のアルバムを削除した場合' do
      it 'そのアルバムがマイページから消えている' do
        visit user_path(user.id)
        click_link '台湾'
        click_link 'アルバムを削除'
        page.accept_alert
        expect(page).not_to have_content '台湾'
      end
    end
  end

  describe '一覧表示機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'general@example.com'
      fill_in 'user_password', with: 'testpassword'
      click_button 'commit'
    end
    context 'ユーザ詳細画面に遷移した場合' do
      it '公開されているアルバムが旅行時期が早いもの順に表示される' do
        visit user_path(user.id)
        expect(page.text).to match(/#{album.title}[\s\S]*#{third_album.title}/)
      end
    end
  end

  describe '検索機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'general@example.com'
      fill_in 'user_password', with: 'testpassword'
      click_button 'commit'
    end
    context '国名・エリア名であいまい検索をした場合' do
      it '検索キーワードを含むアルバムで絞り込まれる' do
        visit users_path
        fill_in 'title', with: '北'
        click_button 'commit'
        expect(page).to have_content '北海道'
      end
    end
  end

  describe 'アクセス制限機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'general@example.com'
      fill_in 'user_password', with: 'testpassword'
      click_button 'commit'
    end
    context '他のユーザのアルバムを編集しようとした場合' do
      it '「アクセス権限がありません」と表示される' do
        second_user_album = FactoryBot.create(:album, title: '東京', visited_on:'2022-09-01' , user: second_user)
        visit edit_album_path(second_user_album.id)
        expect(page).to have_content 'アクセス権限がありません'
      end
    end
  end
  
end
