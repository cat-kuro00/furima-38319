require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品' do

    context '出品できる場合' do
      it 'image, name, info, category_id, condition_id, shipping_id, prefecture_id, ship_days_id, priceが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'imageが空では保存できない' do

      end
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "name can't be blank"
      end
      it 'infoが空では保存できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "info can't be blank"
      end
      it 'category_idが空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "category id can't be blank"
      end
      it 'condition_idが空では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "condition id can't be blank"
      end
      it 'shipping_idが空では保存できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "shipping id can't be blank"
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "prefecture id can't be blank"
      end
      it 'ship_days_idが空では保存できない' do
        @item.ship_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "ship days id can't be blank"
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "price can't be blank"
      end
      it 'priceが300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "price is invalid"
      end

      end
      it 'userが紐付いていないと保存できない' do

      end
    end
  end
end
