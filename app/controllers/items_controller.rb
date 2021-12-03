class ItemsController < ApplicationController

  def index
  #   @item = Item.all
  end

  def create
  end

  def delete
  end

  private

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end


end
