class BuyAddress
  include ActiveModel::Model
  attr_accessor :buy,:address

  validates :image, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end