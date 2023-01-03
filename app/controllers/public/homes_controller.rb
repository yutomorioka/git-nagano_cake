class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    
  end

  def about
  end
  
  private
	def params_item
		parmas.require(:item).permit(:image ,:name )
	end
  
end
