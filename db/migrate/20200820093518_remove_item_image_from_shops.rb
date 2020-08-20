class RemoveItemImageFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :item_image, :text
  end
end
