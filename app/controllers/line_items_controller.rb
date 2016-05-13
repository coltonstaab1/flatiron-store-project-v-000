class LineItemsController < ApplicationController

  def create
    if current_user.current_cart.nil?
      cart = Cart.create
      current_user.current_cart = cart
      current_user.save
    end
    cart.add_item(params[:item_id])
    #LineItem.create(:cart_id => current_user.current_cart.id, :item_id => params[:item_id])
    redirect_to cart_path(current_user.current_cart)
  end

end
