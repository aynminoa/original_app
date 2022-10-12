require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context '名前の入力欄が空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: '', email: 'yamada@example.com', password: 'test', password_confirmation: 'test')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが6文字以下の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: '山田花子', email: 'yamada@example.com', password: 'test', password_confirmation: 'test')
        expect(user).not_to be_valid
      end
    end
    context '全ての項目が入力されている場合' do
      it '登録が完了する' do
        user = User.new(name: '山田花子', email: 'yamada@example.com', password: 'yamadatest', password_confirmation: 'yamadatest')
        expect(user).to be_valid
      end
    end
  end

  describe 'メソッドのテスト' do
    context 'guestメソッドを使用した場合' do
      it '定義されたユーザが作成できる' do
        user = User.guest
        expect(user.name).to eq 'ゲスト'
        expect(user.email).to eq 'guest@example.com'
        expect(user.admin).to eq false
      end
    end
    context 'guest_adminメソッドを使用した場合' do
      it '定義されたユーザが作成できる' do
        user = User.guest_admin
        expect(user.name).to eq '管理者ゲスト'
        expect(user.email).to eq 'guest_admin@example.com'
        expect(user.admin).to eq true
      end
    end
  end
end
