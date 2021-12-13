class Address < ApplicationRecord
  belongs_to :purchase 
  validates :post_cord,          presence: true
  validates :prefecture_id,      presence: true
  validates :city,               presence: true
  validates :address,            presence: true
  validates :phhone_number,      presence: true

  belongs_to :purchase

end
