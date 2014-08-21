class Dashboard::OrdersController < Dashboard::BaseController
  def index
    @order = Order.new
    @orders = current_user.origin_orders
  end

  def create
    @order = Order.new(user_params)
    @order.originzer = current_user
    @order.save
    CrawlTdd.perform_async(@order.id)
    redirect_to dashboard_orders_url
  end

  def show
    @order = Order.find(params[:id])
    @hash = {}
    @order.user_item_ables.where(order_id: @order.id).each do |item|
      name = item.product_item.name
      if @hash[name]
        @hash[name] += item.count
      else
        @hash[name] = item.count
      end
    end
  end

  def finish_check
    @order = Order.find(params[:id])
    @order.update(is_success: 2)
    redirect_to dashboard_order_path(@order)
  end

  private

  def user_params
    params.require(:order).permit(:source_url, :finish_time, :content)
  end

  
end
