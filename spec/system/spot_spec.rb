require 'rails_helper'
RSpec.describe 'スポット管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:album) { FactoryBot.create(:album, user: user) }
  let!(:second_album) { FactoryBot.create(:second_album, user: second_user) }
  let!(:spot) { FactoryBot.create(:spot, album: album) }
  let!(:second_spot) { FactoryBot.create(:second_spot, album: album) }
  let!(:third_spot) { FactoryBot.create(:third_spot, album: second_album) }

  describe 'CRUD機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'general@example.com'
      fill_in 'user_password', with: 'testpassword'
      click_button 'commit'
      visit user_path(user.id)
      click_link '台湾' 
    end
    context '（新規作成機能）スポットを新規作成した場合' do
      it '作成したスポットが地図も含めて表示される' do
        click_link 'スポットを追加'
        select 'その他', from: 'spot_category' 
        fill_in 'spot_name', with: '台北101'
        fill_in 'pac-input', with: '台北市信義路五段7号89F'
        click_button 'commit'
        expect(page).to have_content '台北101'
        expect(page).to have_css '.gm-style'
        end
      end
      context '（詳細表示機能）任意のスポットを選択した場合' do
        it 'そのスポットの詳細画面に遷移する' do
          click_link '鼎泰豊'
          expect(current_path).to eq spot_path(spot)
          expect(page).to have_content '鼎泰豊'
        end
      end
      context '（編集機能）スポットを編集した場合' do
        it '変更した内容がスポット詳細画面に反映されている' do
          click_link '鼎泰豊'
          click_link 'スポットを編集'
          fill_in 'spot_comment', with: '30分くらい待つ覚悟で。'
          click_button 'commit'
          expect(page).to have_content '30分くらい待つ覚悟で。'
        end
      end
      context '（削除機能）スポットを削除した場合' do
        it 'そのスポットがアルバム詳細画面から消えている' do
          click_link '鼎泰豊'
          click_link 'スポットを削除'
          page.accept_alert
          expect(page).not_to have_content '鼎泰豊'
        end
      end
    end

    describe '一覧表示機能' do
      before do
        visit new_user_session_path
        fill_in 'user_email', with: 'general@example.com'
        fill_in 'user_password', with: 'testpassword'
        click_button 'commit'
        visit user_path(user.id)
        click_link '台湾' 
      end
      context 'アルバム詳細画面に遷移した場合' do
        it '作成済みのスポット一覧が表示される' do
          expect(page.text).to match(/#{spot.name}[\s\S]*#{second_spot.name}/)
        end
      end
    end

    describe 'お気に入り登録機能' do
      before do
        visit new_user_session_path
        fill_in 'user_email', with: 'general@example.com'
        fill_in 'user_password', with: 'testpassword'
        click_button 'commit'
        visit user_path(second_user.id)
        click_link 'カナダ' 
        click_link 'グランビルアイランド'
      end
      context 'お気に入り登録をした場合' do
        it '赤いハートマークが表示される' do
          find( '.like').click
          expect(page).to have_css('.dislike')
        end
      end
      context 'お気に入り登録を解除した場合' do
        it '白抜きのハートマークが表示される' do
          find( '.like').click
          expect(page).to have_css('.dislike')
          find( '.dislike').click
          expect(page).to have_css('.like')
        end
      end
    end

  end









# 一覧表示機能
# 任意のアルバム詳細画面に遷移した場合
# 　作成済みのスポット一覧が表示される

# お気に入り登録機能
# お気に入り登録をした場合
# 　赤いハートマークが表示される
# お気に入り登録を解除した場合
# 　白抜きのハートマークが表示される

# アクセス制限機能
# 他のユーザのスポットを編集しようとした場合
# 　「アクセス権限がありません」と表示される
