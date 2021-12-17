class PurchasesController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :find, only:[:index, :create] 

  def index
    @purchase_address = PurchaseAddress.new
    if @item.purchase.nil? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)      
    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(  
        amount: @item.price,
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :delivery_place_id, :city, :address, :building, :phone_number, :price).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end

  def find
    @item = Item.find(params[:item_id])
  end


end
