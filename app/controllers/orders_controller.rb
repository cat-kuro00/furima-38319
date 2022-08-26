class OrdersController < ApplicationController
  def index
    
    @item = Item.find_by(id: params[:item_id])
    

    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = "sk_test_35604bbb7014a1376345c4bf"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

end
