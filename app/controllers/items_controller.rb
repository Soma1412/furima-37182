class ItemsController < ApplicationController

  before_action :authenticate_user!, only:[:new, :destroy, :edit] 
  before_action :move_to_edit, only: [:edit]
  before_action :multi_action, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end


  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update 
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
  end
  

  private

  def multi_action
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :explain, :price, :category_id, :delivery_cost_id, :condition_id, :delivery_day_id, :delivery_place_id).merge(user_id: current_user.id)
  end

  def move_to_edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

end
