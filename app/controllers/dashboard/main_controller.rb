class Dashboard::MainController < Dashboard::BaseController
  
  def index
    @orders = Order.succeed
  end

end
