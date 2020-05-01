require_relative "../../../service/microposts_controller_service"

class Api::V1::MicropostsController < ApiController

  # 新規投稿
  def create
    begin
      result = MicropostsControllerService.create_post(params[:user_id], params[:micropost])
      if result != true
        raise result
      else
        render json:{}, status: 200
      end
    rescue ActiveRecord::RecordInvalid
      render json:{}, status: 500
    end
  end

  # micropost投稿時に渡すuser_idを渡す
  def index
    user_id = session[:user_id]
    render json: user_id
  end

  #個人のMicropostを渡す
  def show
    render json: MicropostsControllerService.find_personal_micropst(params[:id])
  end

  # 投稿記事を消去する。
  def destroy
    if MicropostsControllerService.destoroy_micropost(params[:id])
      render json:{}, status: 200
    else
      render json:{}, status: 500
    end
    
  end

end