class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :post_cord, :prefecture_id, :city, :address, :building, :phone_number, :purchase, :user, :item
  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :city, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # 半角英字数字のみ許可する
    validates :post_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はXXX-XXXXのように記入してください (記入例：123-4567)" }
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "はXXXXXXXXXXXXXのように記入してください"}
  end

  def save
    purchase = Purchase.create(price: price, user_id: user_id)
    # 住所を保存する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end