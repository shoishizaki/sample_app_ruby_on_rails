class Api::V1::StaticPagesController < ApiController
  
  def index
    logger.debug("start start =====================================")
    microposts = Micropost.all
    logger.debug("---------------------------------------")
    logger.debug(microposts)
    logger.debug("---------------------------------------")
    render json: microposts
  end

  def help
  end

  def about
  end

  def contact
  end
end