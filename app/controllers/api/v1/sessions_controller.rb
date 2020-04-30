require_relative "../../../service/sessions_controller_service"

class Api::V1::SessionsController < ApiController
  
  # ログイン認証
  def create
    if SessionsControllerService.session_user(params[:email].downcase, params[:password])
      session[:user_id] = SessionsControllerService.session_user(params[:email].downcase, params[:password])
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end
  
  # ログアウト機能
  def destroy
    session.delete(:user_id)
    render json: {}, status: 200
  end
    
end