class Api::V1::SessionsController < ApiController
  
  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      session[:user_id] = user.id
      render json: {}, status: :ok
    else
      render json: {}, status: 500
    end
  end
    
end