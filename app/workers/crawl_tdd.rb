require 'capybara/poltergeist'
require 'base64'

class CrawlTdd
  include Sidekiq::Worker
  include Capybara::DSL

  sidekiq_options :retry => false

  def perform(order_id)
    @order = Order.find_by_id(order_id)
    unless @order.nil?
      Capybara.default_selector = :css
      Capybara.default_driver = :poltergeist
      Capybara.javascript_driver = :poltergeist
      cur_page = 1
      url = @order.source_url
      while cur_page
        real_url = url + "&page=#{cur_page}"
        
        begin
          page.driver.visit(real_url)
        rescue => err
          p err.to_s
          next
        end

        if cur_page == 1
          title = page.evaluate_script(%{KISSY.DOM.html(KISSY.query('b',KISSY.query('h1', KISSY.query('.some-info'))))})
          address = page.evaluate_script(%{KISSY.DOM.html(KISSY.query('.store-add'))})
          tel = page.evaluate_script(%{KISSY.DOM.html(KISSY.query('span', KISSY.query('.store-tel')))})
          @shop = Shop.create(name: title, address: address, tel: tel, source_url: url, order_id: order_id)
        end

        if page.has_selector?('.shop-no-goods')
          p "no goods! at page #{cur_page}" 
          @order.update!(is_success: 1)
          break
        end
        count = page.evaluate_script(%{KISSY.query('.layerup').length}).to_i
        (1..count).each do |index|
          name = page.evaluate_script(%{KISSY.DOM.attr(KISSY.query('.img-link', KISSY.query('.layerup')[#{index - 1}]), 'title')}).to_s
          # p name
          encode_url = Base64.strict_encode64(real_url + index.to_s + Time.now.to_i.to_s)
          page.driver.render("public/item_images/#{encode_url}.png", {selector: ".menu-list li:nth-child(#{index})"} )

          local_url = "/item_images/#{encode_url}.png"
          ProductItem.create(image_url: local_url, name: name, shop_id: @shop.id)
        end
        cur_page += 1
      end
      # p @title
      # p @address
      # p @tel

      p 'crawl finish!'
      # order.update(is_success: count+1)
    end
  end
end