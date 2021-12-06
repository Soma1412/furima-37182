class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :delivery_day
  belongs_to :delivery_place


  validates :item_name,           presence: true
  validates :explain,             presence: true 
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :delivery_cost_id,    presence: true
  validates :delivery_day_id,     presence: true
  validates :delivery_place_id,   presence: true
  validates :price,               presence: true, inclusion: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/}

  belongs_to :user
  has_one    :purchase
  has_one_attached :image
end
