class Api::V1::MicropostsController < ApiController

def create
    content = params[:micropost]
    user_id = params[:user_id]
    micropost_data = Micropost.new(user_id: user_id, content: content)
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
  user_id = params[:id]
  user_micropost = Micropost.where(user_id: user_id)
  render json: user_micropost
end

def destroy
  micropost = Micropost.find(params[:id])
  micropost.destroy
  render json:{}, status: 200
end

end