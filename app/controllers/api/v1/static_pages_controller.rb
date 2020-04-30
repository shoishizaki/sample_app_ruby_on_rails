require_relative "../../../service/static_pages_controller_service"

class Api::V1::StaticPagesController < ApiController

  def initialize
    @service = StaticPagesControllerService.new
  end
  
  def index
    render json: @service.get_all_microposts
  end

  def help
  end

  def about
  end

  def contact
  end

end