class Exhibition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :fee
  belongs_to_active_hash :sending_area
  has_one_attached :image
  has_one :order, dependent: :destroy

  with_options presence: true do

    validates :image
    validates :item_name
    validates :item_info

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :fee_id
      validates :sending_area_id
      validates :delivery_time_id
    end

    validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

end
