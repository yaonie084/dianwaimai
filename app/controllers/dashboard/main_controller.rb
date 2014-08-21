class Dashboard::MainController < Dashboard::BaseController
  def index
    @orders = Order.where(is_success: 1)
  end
end
