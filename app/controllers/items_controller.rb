class ItemsController < ApplicationController
  #before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all.order('created_at DESC') 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save action: :index
    else
      render :new 
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :situation_id, :load_id, :shipping_origin_id, :number_of_day_id, :price,).merge(user_id: current_user.id)
  end
end
