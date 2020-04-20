class Api::V1::SessionsController < ApiController
  
  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      session[:user_id] = user.id
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    render json: {}, status: 200
  end
    
end