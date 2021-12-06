require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
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

    it 'categoryが空だと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'sales statusが空だと出品できない' do
      @item.condition_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'shipping feeが空だと出品できない' do
      @item.delivery_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
    end

    it 'prefectureが空だと出品できない' do
      @item.delivery_place_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery place can't be blank")
    end

    it 'scheduled deliveryが空だと出品できない' do
      @item.delivery_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end
  end
 end
end

