class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    if @customer = current_customer
      @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render 'edit'
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def customer_params
      params.require(:customer).permit(:last_name, :first_name,
                                       :kana_last_name, :kana_first_name,
                                       :email, :postal_code, :address, :telephone_number)
  end

end
