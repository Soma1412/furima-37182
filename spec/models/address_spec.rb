require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

describe '商品の購入' do
  context '商品が購入できるとき' do

    it '商品購入に必要な情報が正しく入力されている' do
      expect(@address).to be_valid
    end
  end

  context '商品が購入できないとき' do

    it '郵便番号が空のとき' do
      @address.post_code = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("a")
    end

    it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @address.delivery_place_id = '0'
      binding.pry
      @address.valid?
      expect(@address.errors.full_messages).to include("a")
    end

    it '市区町村が空のときは購入できない' do
      @address.city = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("a")
    end

    it '番地が空のときは購入できない' do
      @address.address = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("a")
    end

    it '電話番号が空のときは購入できない' do
      @address.phone_number = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("a")
    end

    it '郵便番号がハイフンがないときは購入できない' do
      @address.post_code = '112233'
      @address.valid?
      expect(@address.errors.full_messages).to include("a")
    end

    it '電話番号が半角数字が入力されてないときは購入できない' do
      @address.post_code = 'aaaaaaa'
      @address.valid?
      expect(@address.errors.full_messages).to include("a")
    end
  end
 end
end
