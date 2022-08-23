class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :ship_days
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_id, presence: true
  validates :prefecture_id, presence: true
  validates :ship_days_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 299,less_than: 9999999, only_integer: true}

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :ship_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  
end
