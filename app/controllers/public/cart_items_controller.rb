class Public::CartItemsController < ApplicationController
  def index
     @cart_items= CartItem.all
     @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save!
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
