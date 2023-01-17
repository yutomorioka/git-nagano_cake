class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items.destroy_all
    redirect_to orders_confirm_path
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 800
    @total_payment = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    
    if params[:order][:address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
      render 'confirm'
    elsif params[:order][:address] == "1"
      @order = Order.new(order_params)
      @address = Addreaa.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      render 'confirm'
    elsif params[:order][:address] == "2"
      @address = current_customer.addresses.new
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.postal_code= params[:order][:postal_code]
      @address.customer_id = current_customer.id
      if @address.save
      @order.postal_code = @address.postal_code
      @order.name = @address.name
      @order.address = @address.address
      else
       render 'new'
      end
    end
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end

end
