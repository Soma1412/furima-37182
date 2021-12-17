class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :token, :post_code, :delivery_place_id, :city, :address, :building, :phone_number, :purchase, :user_id 

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :city, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # 半角英字数字のみ許可する
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input crrectly" }
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid."}
    # delivery_place_idは0以外選択できない
    validates :delivery_place_id,    numericality: { other_than: 0 }
    # 空の値は保存できない
    validates :address
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    Address.create(post_code: post_code, delivery_place_id: delivery_place_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end