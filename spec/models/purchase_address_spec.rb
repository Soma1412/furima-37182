require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
  
  describe '商品の購入' do
    context '商品が購入できるとき' do
  
      it '商品購入に必要な情報が正しく入力されている' do
        expect(@purchase_address).to be_valid
      end
    end
  
    context '商品が購入できないとき' do
  
      it '郵便番号が空のとき' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
  
      it 'カテゴリーに「---」が選択されている場合は購入できない' do
        @purchase_address.delivery_place_id = '0'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Delivery place must be other than 0")
      end
  
      it '市区町村が空のときは購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
  
      it '番地が空のときは購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
  
      it '電話番号が空のときは購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
  
      it '郵便番号がハイフンがないときは購入できない' do
        @purchase_address.post_code = '112233'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code Input crrectly")
      end
  
      it '電話番号が半角数字が入力されてないときは購入できない' do
        @purchase_address.phone_number = 'aaaaaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end

