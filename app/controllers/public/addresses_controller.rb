class Public::AddressesController < ApplicationController
  def index
    @adress = Adress.new
    @adresses = Adress.all
  end
  
  def create
    @adress = Adress.new(adress_params)
    @adress.save
    redirect_to adress_path
  end

  def edit
    @adress = Adress.find(params[:id])
  end

  def update
    @adress = Adress.find(params[:id])
    @adress.update(adress_params)
    redirect_to adresses_path
  end

  def destroy
    @adress = Adress.find(params[:id])
    @adress.destroy
    @adress = current_customer.adresses
    redirect_to ship_adresses_path
  end
  
  private
  
  def ship_city_params
    params.require(:adress).permit(:postal_code, :adress, :name)
  end
  
end
