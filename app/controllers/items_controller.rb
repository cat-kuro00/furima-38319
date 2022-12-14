class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set, only: [:edit, :show, :update]
  

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user_id && @item.buy.presence == nil
      redirect_to action: :index
    else
      @item = Item.find(params[:id])
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :condition_id, :shipping_id, :prefecture_id, :ship_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def set
    @item = Item.find(params[:id])
  end
  
  
end
