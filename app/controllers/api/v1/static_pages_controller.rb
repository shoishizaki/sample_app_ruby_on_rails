class Api::V1::StaticPagesController < ApiController
  
  def index
    microposts = Micropost.all
    render json: microposts
  end

  def help
  end

  def about
  end

  def contact
  end
end