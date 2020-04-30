class SessionsControllerService
  class << self

    # ログインユーザーを探す。
    def find_user(email)
      user = User.find_by(email: email)
      return user
    end

  end
end