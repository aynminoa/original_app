require 'rails_helper'
RSpec.describe Spot, type: :model do
  describe 'バリデーションのテスト' do
    let!(:user){FactoryBot.create(:user)}
    let!(:album) { FactoryBot.create(:album, user: user) }
    context '名前が入力されていない場合' do
      it 'バリデーションに引っかかる' do
        spot = Spot.new(name: '', address: '台湾台北市大安区信義路二段194號', category: '食事')
        expect(spot).not_to be_valid
      end
    end
    context '住所が入力されていない場合' do
      it 'バリデーションに引っかかる' do
        spot = Spot.new(name: '鼎泰豊', address: '', category: '食事')
        expect(spot).not_to be_valid
      end
    end
    context 'カテゴリが入力されていない場合' do
      it 'バリデーションに引っかかる' do
        spot = Spot.new(name: '鼎泰豊', address: '台湾台北市大安区信義路二段194號', category: '')
        expect(spot).not_to be_valid
      end
    end
    context '全ての項目が入力されている場合' do
      it '登録が完了する' do
        spot = Spot.new(name: '鼎泰豊', address: '台湾台北市大安区信義路二段194號', category: '食事', album_id: album.id)
        expect(spot).to be_valid
      end
    end
  end

end




