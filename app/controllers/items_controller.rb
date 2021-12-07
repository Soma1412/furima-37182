class ItemsController < ApplicationController

  before_action :authenticate_user!, only:[:new] 

  def index
    @item = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def delete
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explain, :price, :category_id, :delivery_cost_id, :condition_id, :delivery_day_id, :delivery_place_id).merge(user_id: current_user.id)
  end


end
