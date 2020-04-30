require_relative "../../../service/static_pages_controller_service"

class Api::V1::StaticPagesController < ApiController
  
  def index
    render json: create_servive_instance.get_all_microposts
  end

  def help
  end

  def about
  end

  def contact
  end

  private

  # サービス層のインスタンスを作成する。
  def create_servive_instance
    service = StaticPagesControllerService.new
    return service
  end

end