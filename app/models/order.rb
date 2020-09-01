class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :exhibition
  belongs_to_active_hash :sending_area

end
