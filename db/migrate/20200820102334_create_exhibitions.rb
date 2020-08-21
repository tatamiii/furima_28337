class CreateExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibitions do |t|
      t.text       :item_image            , null: false
      t.text       :item_name             , null: false
      t.text       :item_info             , null: false
      t.string     :category_id           , null: false
      t.string     :condition_id          , null: false
      t.string     :fee_id                , null: false
      t.string     :sending_area_id       , null: false
      t.string     :dilivery_time_id      , null: false
      t.integer    :item_price            , null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
