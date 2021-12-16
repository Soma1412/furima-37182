require 'rails_helper'
RSpec.describe PurchaseAddress, type: :model do
    before do
      sleep 0.1
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id )
    end
  
  describe '商品の購入' do
    context '商品が購入できるとき' do
  
      it '商品購入に必要な情報が正しく入力されている' do
        expect(@purchase_address).to be_valid
      end

      it  "建物名が空でも購入できる" do
        @purchase_address.building = ''
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
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it "tokenが空だと購入できないこと" do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank") 
      end


    it '都道府県に「---」が選択されている場合は購入できない' do
      @purchase_address.delivery_place_id = '0'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Delivery place must be other than 0")
    end

  it '電話番号が9桁以下では購入できない' do
      @purchase_address.phone_number = '1'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid.")
    end

  it "電話番号が12桁以上では購入できない" do
    @purchase_address.phone_number = '111111111111111'
    @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid.")
    end

  it "userが紐付いていなければ購入できない" do
    @purchase_address.user_id = nil
    @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
  end

  it'itemが紐付いていなければ購入できない' do
    @purchase_address.item_id = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
  end
     
    end
  end
end

