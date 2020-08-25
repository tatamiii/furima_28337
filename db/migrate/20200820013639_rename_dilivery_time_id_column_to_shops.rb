class RenameDiliveryTimeIdColumnToShops < ActiveRecord::Migration[6.0]
  def change
    rename_column :shops, :dilivery_time_id, :delivery_time_id
  end
end
