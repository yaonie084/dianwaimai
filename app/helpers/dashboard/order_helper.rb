module Dashboard::OrderHelper

  def shop_name(order)
    if order.shop
      return order.shop.name
    else
      return "正在获取"
    end
  end

  def success_status(number)
    if number == 0
      ""
    elsif number == 1
      "正在点餐"
    elsif number == 2
      "点餐结束"
    else
      number
    end
  end
end
