class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :self_introduction, :image, :admin])
    # アカウント編集時
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :self_introduction, :image])
  end
end
