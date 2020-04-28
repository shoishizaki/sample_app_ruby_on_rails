require_relative "../../../service/users_controller_service"

class Api::V1::UsersController < ApiController
  
  def index
    service = UsersControllerService.new
    render json: service.get_all_users
  end
  
  # ストロングパラメーターを貼る
  # 統一する書き方を統一する
  # ある程度の部分で改行する
  # 見やすい書き方を心がけて練習する
  def create
    service = UsersControllerService.new
    user = service.create_new_user(params[:name], params[:email].downcase, params[:password], params[:password_confirmation])
      
    if user.save
      session[:user_id] = user.id
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end
  
  #ユーザーの詳細を送る
  def show
    # user = User.find(params[:id])
    service = UsersControllerService.new
    user = service.find_user(params[:id])
    render json: user
  end
  
end