class UsersControllerService

  # ユーザーの全情報を入手する。
  def get_all_users
    users = User.all
    puts users
    return users
  end

end