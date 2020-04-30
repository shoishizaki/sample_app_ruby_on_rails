require_relative "../../../service/sessions_controller_service"

class Api::V1::SessionsController < ApiController
  
  # ログイン認証
  def create
    user = SessionsControllerService.find_user(params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end
  
  # ログアウト機能
  def destroy
    session.delete(:user_id)
    @current_user = nil
    render json: {}, status: 200
  end
    
end