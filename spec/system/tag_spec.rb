require 'rails_helper'
RSpec.describe 'タグ付与機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:album) { FactoryBot.create(:album, user: user) }
  let!(:spot) { FactoryBot.create(:spot, album: album) }
  let!(:second_tag){FactoryBot.create(:second_tag)}
  let!(:third_tag){FactoryBot.create(:third_tag)}

  describe 'スポットにタグを付与する機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'general@example.com'
      fill_in 'user_password', with: 'testpassword'
      click_button 'commit'
    end
    context 'スポットを新規作成した場合' do
      it 'タグを複数つけられる' do
        visit user_path(user.id)
        click_link '台湾'
        click_link 'スポットを追加'
        select 'その他', from: 'spot_category' 
        check 'タグ2'
        check 'タグ3'
        fill_in 'spot_name', with: '台北101'
        fill_in 'pac-input', with: '台北市信義路五段7号89F'
        click_button 'commit'
        expect(page).to have_content 'タグ2'
        expect(page).to have_content 'タグ3'
      end
    end
  end

  describe '詳細表示機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'general@example.com'
      fill_in 'user_password', with: 'testpassword'
      click_button 'commit'
    end
    context '任意のスポット詳細画面に遷移した場合' do
      it '紐づいているタグが表示される' do
        visit user_path(user.id)
        click_link '台湾'
        click_link '鼎泰豊'
        expect(page).to have_content 'タグ1'
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
    context '任意のタグで検索をした場合' do
      it 'そのタグでスポットが絞り込まれる' do
        visit user_path(user.id)
        click_link '台湾'
        click_link 'スポットを追加'
        select 'その他', from: 'spot_category' 
        check 'タグ2'
        check 'タグ3'
        fill_in 'spot_name', with: '台北101'
        fill_in 'pac-input', with: '台北市信義路五段7号89F'
        click_button 'commit'
        click_link '戻る'

        click_link 'スポットを追加'
        select '食事', from: 'spot_category' 
        check 'タグ3'
        fill_in 'spot_name', with: '阜杭豆漿'
        fill_in 'pac-input', with: '台灣台北市中正區忠孝東路一段108號2F'
        click_button 'commit'
        click_link '戻る'

        spot_list = all('.spot_row')
        expect(spot_list.count).to eq 3
        select 'タグ3', from: 'tag_id'
        click_on '検索'
        expect(all('tbody tr')[0]).to have_content 'タグ3'
        expect(all('tbody tr')[1]).to have_content 'タグ3'
        spot_list = all('.spot_row')
        expect(spot_list.count).to eq 2
      end
    end
  end

end