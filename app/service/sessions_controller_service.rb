class SessionsControllerService
  class << self

    # ログインユーザーの認証を確認
    def session_user(email, password)
      user = User.find_by(email: email)
      if user && user.authenticate(password)
        return user.id
      else
        return false
      end
    end

  end
end