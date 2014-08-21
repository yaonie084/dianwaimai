$('#cart_detail').html('');
$('#total_detail').html('');

<%- @user_item_ables.each do |item| %>

  $('#cart_detail').append("<li><%= item.product_item.name %> * <%= item.count %></li>");
  $('#total_detail').append("<li><%= item.product_item.name %> -------- <%= item.count %></li>");

<% end %>
