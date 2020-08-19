class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category,:condition,:delivery_time,:fee_id,:sending_area

  with_options presence: true do

    validates :item_image
    validates :item_name
    validates :item_info

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :fee_id
      validates :sending_area_id
      validates :delivery_time_id
    end

    validates :item_price
  end

end
