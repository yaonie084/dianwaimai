class Dashboard::ProductItemsController < Dashboard::BaseController
  def add_item_count
    common_change_item_count(1)
    render :change_item_count
  end

  def sub_item_count
    common_change_item_count(-1)
    @user_item_able.destroy if @user_item_able && @user_item_able.count <= 0
    render :change_item_count
  end

  private

  def common_change_item_count(number)
    @product_item = ProductItem.find(params[:id])
    @user_item_ables = UserItemAble.where(user_id: current_user.id, product_item_id: @product_item.id)
    if @user_item_ables.length > 0
      @user_item_able = @user_item_ables.first
      @user_item_able.update(count: @user_item_able.count + number) if @user_item_able.count + number >= 0
    else
      @user_item_able = UserItemAble.create(user: current_user, product_item: @product_item, order_id: params[:order_id], count: 1) if number > -1
    end

    @user_item_ables = current_user.user_item_ables.where(order_id: params[:order_id])

  end

end