require_relative "../../../service/users_controller_service"

class Api::V1::UsersController < ApiController
  
  # ユーザー一覧を送る
  def index
    render json: UsersControllerService.get_all_users
  end
  
  # 新規ユーザー登録を行う。
  def create
    user_id = UsersControllerService.create_new_user(params[:name], params[:email].downcase,
                                                     params[:password], params[:password_confirmation])
    if user_id
      session[:user_id] = user_id
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end
  
  #ユーザーの詳細を送る
  def show
    begin
      user = UsersControllerService.find_user(params[:id])
      render json: user
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: 500
    end
  end
  
end