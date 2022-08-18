class ItemsController < ApplicationController

  def index
  end

  def new
    Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:item, :info, :category, :condition, :shipping, :prefecture, :ship_days, :price).merge(user_id: current_user.id)
  end
end
