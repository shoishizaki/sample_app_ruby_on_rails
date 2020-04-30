require_relative "../../../service/users_controller_service"

class Api::V1::UsersController < ApiController

  def initialize
    @service = UsersControllerService.new
  end
  
  # ユーザー一覧を送る
  def index
    render json: @service.get_all_users
  end
  
  # 新規ユーザー登録を行う。
  def create
    user = @service.create_new_user(params[:name], params[:email].downcase,
                                                   params[:password], params[:password_confirmation])
      
    if user.save
      session[:user_id] = user.id
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end
  
  #ユーザーの詳細を送る
  def show
    user = @service.find_user(params[:id])
    render json: user
  end
  
end