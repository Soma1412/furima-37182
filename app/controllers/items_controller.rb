class ItemsController < ApplicationController

  # before_action :another_user, only[:new]

  def index
  #   @item = Item.all
  end

  def create
  end

  def delete
  end

  def new
  end

  def create
  end
  
  private

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end


end
