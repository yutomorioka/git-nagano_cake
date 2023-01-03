class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def unsubscribe
  end

  def withdraw
  end
  
  private
  def customer_params
      params.require(:customer).permit(:last_name, :first_name,
                                       :last_name_kana, :first_name_kana,
                                       :email, :postal_code, :adress, :telephone_number)
  end  

end
