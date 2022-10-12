require 'rails_helper'
RSpec.describe Album, type: :model do
  describe 'バリデーションのテスト' do
    let!(:user){FactoryBot.create(:user)}
    context 'タイトルが入力されていない場合' do
      it 'バリデーションに引っかかる' do
        album = Album.new(title: '', visited_on: '2022-10-01')
        expect(album).not_to be_valid
      end
    end
    context '訪問時期が入力されていない場合' do
      it 'バリデーションに引っかかる' do
        album = Album.new(title: 'アメリカ', visited_on: '')
        expect(album).not_to be_valid
      end
    end
    context '全ての項目が入力されている場合' do
      it '登録が完了する' do
        album = Album.new(title: 'アメリカ', visited_on: '2022-10-01', user_id: user.id)
        expect(album).to be_valid
      end
    end
  end

  describe '公開設定での絞り込み機能' do
    let!(:user){FactoryBot.create(:user)}
    let!(:album) { FactoryBot.create(:album, user: user) }
    let!(:second_album) { FactoryBot.create(:second_album, user: user) }
    let!(:third_album) { FactoryBot.create(:third_album, user: user) }
    let!(:fourth_album) { FactoryBot.create(:fourth_album, user: user) }
    context 'scopeメソッドでアルバムを抽出した場合' do
      it 'published属性がtrueのアルバムだけが表示される' do
        expect(Album.published.count).to eq 3
      end
    end
  end

end