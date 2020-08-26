class AddPurchaserIdToExhibitions < ActiveRecord::Migration[6.0]
  def change
    add_column :exhibitions, :purchaser_id, :integer
  end
end
