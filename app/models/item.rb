class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture_code
  belongs_to :ship_days

  validates :category, presence: true
  validates :condition, presence: true
  validates :shipping, presence: true
  validates :prefecture_code, presence: true
  validates :ship_days, presence: true
  validates :price, presence: true, numericality: { in: 300..9999999 }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_code_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  # id:1以外のときに保存できる デフォルトのエラーメッセージでは「must be other than 0」と表示されてしまうため。
end
