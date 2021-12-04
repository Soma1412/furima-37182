class ItemsController < ApplicationController

  # before_action :another_user, only[:new]

  def index
  #   @item = Item.all
  end

  def create
    @item = Item.create(item_params)
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
    params.require(:item).permit(:image, :item_name, :explain, :price).merge(user_id: current_user.id)
  end


end
