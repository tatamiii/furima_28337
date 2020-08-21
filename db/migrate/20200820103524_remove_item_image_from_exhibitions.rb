class RemoveItemImageFromExhibitions < ActiveRecord::Migration[6.0]
  def change
    remove_column :exhibitions, :item_image, :text
  end
end
