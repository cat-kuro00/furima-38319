class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :post, :prefecture_id, :city, :block_num, :building, :price, :phone_num, :buy_id, :user_id


  with_options presence: true do
    validates :token
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block_num
    validates :phone_num
    validates :buy_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  

  def save
    buy = Buy.create(buy_id: buy_id, user_id: user_id)
    Address.create(post: post, prefecture_id: prefecture_id, city: city, block_num: block_num, building: building, buy_id: buy.id)
  end
end