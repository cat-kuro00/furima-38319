class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :ship_days
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :shipping, presence: true
  validates :prefecture, presence: true
  validates :ship_days, presence: true
  validates :price, presence: true, numericality: { greater_than: 299,less_than: 9999999 }, format: { with: /\A[0-9]+\z/ }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :ship_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  # id:1以外のときに保存できる デフォルトのエラーメッセージでは「must be other than 0」と表示されてしまうため。
end
