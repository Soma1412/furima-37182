require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
    @user.valid?
    expect(@item.errors.full_messages).to include("a")
  end

  it 'infoが空だと出品できない'
    @item.explain = ''
    @item.varid?
    expect(@item.errors.full_messages).to include("a")
  end

  it 'priceが空だと出品できない'
    @item.explain = ''
    @item.varid?
    expect(@item.errors.full_messages).to include("a")
  end

  it 'priceは半角数字以外での入力は出品できない' do
    @item.price = 'aaaaaaa'
    @item.varid?
    expect(@item.errors.full_messages).to include("a")
  end


  it 'priceが10,000,000円以上は出品できない'
    @item.price = '900,000,000,000'
    @item.varid?
    expect(@item.errors.full_messages).to include("a")
  end

  it 'categoryが空だと出品できない'
  @item.item_name = ''
    @user.valid?
    expect(@item.errors.full_messages).to include("a")
  end

  it 'sales statusが空だと出品できない'
  @item.item_name = ''
    @user.valid?
    expect(@item.errors.full_messages).to include("a")
  end

  it 'shipping feeが空だと出品できない'
  @item.item_name = ''
    @user.valid?
    expect(@item.errors.full_messages).to include("a")
  end

  it 'prefectureが空だと出品できない'
  @item.item_name = ''
    @user.valid?
    expect(@item.errors.full_messages).to include("a")
  end

  it 'scheduled deliveryが空だと出品できない'
  @item.item_name = ''
    @user.valid?
    expect(@item.errors.full_messages).to include("a")
  end



end
