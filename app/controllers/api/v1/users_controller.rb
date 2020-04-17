class Api::V1::UsersController < ApiController
  
  def create
    name = params[:name]
    email = params[:email].downcase
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    user = User.new(name: name, email: email, password: password, password_confirmation: password_confirmation, activated: true)
    if user.save
      session[:user_id] = user.id
      render json: {}, status: :ok
    else
      render json: {}, status: 500
    end
  end
  
end