class SessionsControllerService

  # ログインユーザーを探す。
  def find_user(email)
    user = User.find_by(email: email)
  end

end