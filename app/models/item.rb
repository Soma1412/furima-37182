class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :item_name,           presence: true
  validates :explain,             presence: true
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :delivery_cost_id,    presence: true
  validates :delivery_day_id,     presence: true
  validates :delivery_place_id,   presence: true
  validates :price,               presence: true

  belongs_to :user
  has_one    :purchase
  has_one_attached :image
end
