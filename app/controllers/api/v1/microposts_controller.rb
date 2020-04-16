class Api::V1::MicropostsController < ApiController

def create
    content = params[:micropost]
    user_id = params[:user_id]
    micropost_data = Micropost.new(user_id: user_id, content: content)
    if micropost_data.save
        render json: {} ,status: :ok
    else
      render 'static_pages/home'
    end
end

# micropost投稿時に渡すuser_idを渡す
def index
  user_id = session[:user_id]
  render json: user_id
end

end