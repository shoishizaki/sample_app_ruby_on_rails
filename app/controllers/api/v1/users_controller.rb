require_relative "../../../service/users_controller_service"

class Api::V1::UsersController < ApiController
  
  def index
    user = UsersControllerService.new
    render json: user.get_all_users
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
  
  #ユーザーの詳細を送る
  def show
    user = User.find(params[:id])
    render json: user
  end
  
end