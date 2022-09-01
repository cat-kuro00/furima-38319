require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'postが空だと保存できないこと' do
        @buy_address.post = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Post can't be blank"
      end
      it 'postが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.post = '1111111'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Post is invalid. Include hyphen(-)"
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @buy_address.prefecture_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが"---"のときは保存できないこと' do
        @buy_address.prefecture_id = 0
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "City can't be blank"
      end
      it 'block_numが空だと保存できないこと' do
        @buy_address.block_num = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Block num can't be blank"
      end
      it 'phone_numが空では保存できないこと' do
        @buy_address.phone_num = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Phone num can't be blank"
      end
      it 'phone_numが半角数値でないと保存できないこと' do
        @buy_address.phone_num = '１１１１１１１１１１'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Phone num is not a number"
      end
      it 'phone_numが9桁以下では保存できないこと' do
        @buy_address.phone_num = '111111111'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Phone num is too short (minimum is 10 characters)"
      end
      it 'phone_numが12桁以上では保存できないこと' do
        @buy_address.phone_num = '111111111111'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Phone num is too long (maximum is 11 characters)"
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
