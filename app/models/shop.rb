class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :fee
  belongs_to_active_hash :sending_area
  has_one_attached :item_image
end
