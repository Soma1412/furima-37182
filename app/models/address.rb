class Address < ApplicationRecord
  belongs_to :purchase 
  validates :post_code,          presence: true
  validates :delivery_place_id,      presence: true
  validates :city,               presence: true
  validates :address,            presence: true
  validates :phhone_number,      presence: true

  belongs_to :purchase

end
