require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    sleep(0.1)
  end

  describe '商品の出品' do
  context '商品が出品できるとき' do
    
    it '商品出品に必要な情報が正しく入力されている' do
      expect(@item).to be_valid
    end
  end

  context '商品が出品できないとき' do
    it 'item_nameが空では出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it 'infoが空だと出品できない' do
      @item.explain = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end

    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは半角数字以外での入力は出品できない' do
      @item.price = 'aaaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end


    it 'priceが10,000,000円以上は出品できない' do
      @item.price = '100,000,000,000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが299円以下は出品できない' do
      @item.price = '280'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end


    it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @item.category_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end

    it '商品の状態に「---」が選択されている場合は出品できない' do
      @item.condition_id= '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 0")
    end

    it '配送料の負担に「---」が選択されている場合は出品できない' do
      @item.delivery_cost_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery cost must be other than 0")
    end

    it '発送元の地域に「---」が選択されている場合は出品できない' do
      @item.delivery_place_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery place must be other than 0")
    end

    it '発送までの日数に「---」が選択されている場合は出品できない' do
      @item.delivery_day_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 0")
    end

    it'商品画像が空では出品出来ない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

  
  end
 end
end

