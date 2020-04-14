class Api::V1::SessionsController < ApiController
  
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {}, status: :ok
    else
      render json: {}, status: 500
    end
  end
    
end