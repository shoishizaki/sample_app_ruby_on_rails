require_relative "../../../service/microposts_controller_service"

class Api::V1::MicropostsController < ApiController

  def initialize
    @service = MicropostsControllerService.new
  end

  # 新規投稿
  def create
    micropost_data = @service.create_post(params[:user_id], params[:micropost])
    if micropost_data.save
      render json: {} ,status: :ok
    else
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
    render json: @service.find_personal_micropst(params[:id])
  end

  # 投稿記事を消去する。
  def destroy
    @service.find_micropost(params[:id]).destroy
    render json:{}, status: 200
  end

end