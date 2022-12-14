class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [ :show, :edit, :update, :destroy]
  before_action :item_set, only: [ :edit, :destroy]
  
  def index
    @items = Item.all.order('created_at DESC') 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new 
    end
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
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :situation_id, :load_id, :shipping_origin_id, :number_of_day_id, :price,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_set
    if current_user.id != @item.user_id || @item.order.present?
      redirect_to action: :index
    end
  end

end