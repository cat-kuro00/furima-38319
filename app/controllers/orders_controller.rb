class OrdersController < ApplicationController
  def index
    
    @item = Item.find_by(id: params[:item_id])
    

    @order = BuyAddress.new
  end

  def new
    @buy_address = BuynAddress.new
  end

  def create
    @buy_address = BuyAddress.new(order_params)
    if @buy_address.valid?
      Payjp.api_key = "sk_test_35604bbb7014a1376345c4bf"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @buy_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:buy_address).permit(:post, :prefecture_id, :city, :block_num, :building, :price, :phone_num, :buy_id).merge(token: params[:token], user_id: current_user.id)
  end

end
