require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @buy_address = FactoryBot.build(:buy_address)
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
      it 'postが空だと保存できないこと' do
      end
      it 'postが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefecture_idを選択していないと保存できないこと' do
      end
      it 'cityが空だと保存できないこと' do
      end
      it 'block_numが空だと保存できないこと' do
      end
      it 'phone_numが空では保存できないこと' do
      end
      it 'phone_numが10桁以上11桁以内の半角数値でないと保存できないこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
      it 'itemが紐付いていないと保存できないこと' do
      end
      it 'buyが紐付いていないと保存できないこと' do
      end
    end
  end
end
