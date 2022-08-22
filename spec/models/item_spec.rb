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
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'infoが空では保存できない' do
        @item.info = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it 'category_idが空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが空では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'shipping_idが空では保存できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping can't be blank"
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'ship_days_idが空では保存できない' do
        @item.ship_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship days can't be blank"
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300未満では保存できない' do
        @item.price = 299
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Price must be greater than 299"
      end

      
      

    end
  end
end
