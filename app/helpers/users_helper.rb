module UsersHelper
  
  def guest_user
    @guest_user = User.find_by(name: "ゲスト")
  end

  def admin_guest_user
    @admin_guest_user = User.find_by(name: "管理者ゲスト")
  end

end
