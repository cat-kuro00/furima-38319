class OrdersController < ApplicationController
  #  protect_from_forgery #追記


   before_action :authenticate_user!
   before_action :set, only: [:index, :create]
   before_action :top_page, only: :index

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(order_params)
    # binding.pry
    if @buy_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:buy_address).permit(:post, :prefecture_id, :city, :block_num, :building, :phone_num).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def set
    @item = Item.find_by(id: params[:item_id])
  end

  def top_page
    unless current_user.id == @item.user_id 
      if @item.buy.present?
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end
