class PurchasesController < ApplicationController
  
  def index
    @purchase = Purchase.new
  end

  def create
    @purchase_address = PurchaseAddress.new
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end


end
