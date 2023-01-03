class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
  
  rivate

  def order_params
    params.require(:order).permit(:payment, :postal_code, :adress, :name, :shipping, :total_fee)
  end
  
end
