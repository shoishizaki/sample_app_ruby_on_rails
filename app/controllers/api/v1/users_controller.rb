require_relative "../../../service/users_controller_service"

class Api::V1::UsersController < ApiController
  
  # ユーザー一覧を送る
  def index
    render json: create_servive_instance.get_all_users
  end
  
  # 新規ユーザー登録を行う。
  def create
    user = create_servive_instance.create_new_user(params[:name], params[:email].downcase,
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
    user = create_servive_instance.find_user(params[:id])
    render json: user
  end

  private

  # サービス層のインスタンスを作成する。
  def create_servive_instance
    service = UsersControllerService.new
    return service
  end
  
end