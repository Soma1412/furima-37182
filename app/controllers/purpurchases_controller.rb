class PurpurchasesController < ApplicationController
  
  def index
  end

  def new
    @purchse_address = PurchseAddress.new
  end

  def create
    @purchse_address = PurchseAddress.new(purchse_params)
    if @purchse_address.valid?
      @purchse_address.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def donation_params
    params.require(:item_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end


end
