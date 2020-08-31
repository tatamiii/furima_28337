class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :exhibition
  belongs_to_active_hash :sending_area

  with_options presence: true do
    validates :postal_code,format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture,numericality: { other_than: 1 }
    validates :city
    validates :adress
    validates :phone_number,format: {with: /\A\d{11}\z/}
  end

end
