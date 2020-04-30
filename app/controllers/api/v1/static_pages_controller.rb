require_relative "../../../service/static_pages_controller_service"

class Api::V1::StaticPagesController < ApiController
  
  def index
    render json: StaticPagesControllerService.get_all_microposts
  end

  def help
  end

  def about
  end

  def contact
  end

end