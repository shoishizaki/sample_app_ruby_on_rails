class UsersControllerService
  class << self
    
    # ユーザーの全情報を入手する。
    def get_all_users
      users = User.all
      return users
    end

    # ユーザーを新規作成する。
    def create_new_user(name, email, password, password_confirmation)
      user = User.new(name: name, email: email, password: password, 
                      password_confirmation: password_confirmation, 
                      activated: true)
      if user.save
        return user.id
      else
        return false
      end
    end

    # 特定のユーザーを探す。
    def find_user(user_id)
      user = User.find(user_id)
      if user
        return user
      else
        return false
      end
    end

  end
end