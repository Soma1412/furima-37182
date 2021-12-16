# require 'rails_helper'

# RSpec.describe Purchase, type: :model do
#   before do
#     @purchase = FactoryBot.build(:purchase_address)
#   end

# describe '商品の購入' do
#   context '商品が購入できるとき' do

#     it '商品購入に必要な情報が正しく入力されている' do
#       expect(@purchase).to be_valid
#     end
#   end

#   context '商品が購入できないとき' do
#     it '郵便番号が空のとき' do
#       @purchase.post_code = ''
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

#     it 'カテゴリーに「---」が選択されている場合は出品できない' do
#       @purchase.delivery_place_id = '0'
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

#     it '市区町村が空のときは購入できない' do
#       @purchase.city = ''
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

#     it '番地が空のときは購入できない' do
#       @purchase.address = ''
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

#     it '電話番号が空のときは購入できない' do
#       @purchase.phone_number = ''
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

#     it '郵便番号がハイフンがないときは購入できない' do
#       @purchase.post_code = '112233'
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

#     it '電話番号が半角数字が入力されてないときは購入できない' do
#       @purchase.post_code = 'aaaaaaa'
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

# # ・建物名が空でも購入できる
#     it '都道府県に「---」が選択されている場合は購入できない' do
#       @purchase.delivery_place_id = '0'
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

#   it '電話番号が9桁以下では購入できない' do
#       @purchase.phone_number = '1'
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

#   it "電話番号が12桁以上では購入できない" do
#     @purchase.phone_number = '1'
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include("a")
#     end

#   it "userが紐付いていなければ購入できない" do
#       @purchase.user = nil
#       @purchase.valid?
#       expect(@purchase.errors.full_messages).to include('a')
#   end

#   it'itemが紐付いていなければ購入できない' do
#   @purchase.item = nil
#   @purchase.valid?
#     expect(@purchase.errors.full_messages).to include('a')
#   end
  
#   end
#  end
# end

