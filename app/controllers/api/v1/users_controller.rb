class Api::V1::UsersController < ApiController
  
  def index
    users = User.all
    render json: users
  end
  
  # ストロングパラメーターを貼る
  # 統一する書き方を統一する
  # ある程度の部分で改行する
  # 見やすい書き方を心がけて練習する
  def create
    name = params[:name]
    email = params[:email].downcase
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    user = 
      User.new(name: name, email: email, password: password, 
               password_confirmation: password_confirmation, 
               activated: true)
      
    if user.save
      session[:user_id] = user.id
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end
  
end