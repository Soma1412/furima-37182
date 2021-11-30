class Address < ApplicationRecord
  validates :post_cord,          presence: true
  validates :prefecture_id,      presence: true
  validates :city,               presence: true
  validates :address,            presence: true
  varidates :phhone_number,      presence: true

  belongs_to :purchase
end
