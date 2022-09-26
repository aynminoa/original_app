module UsersHelper
  def guest_user
    @guest_user = User.find_by(name: "ゲスト")
  end
end
