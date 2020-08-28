class AddDetailsTo < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :postal_code, :text
    add_column :orders, :prefecture, :text
    add_column :orders, :city, :text
    add_column :orders, :adress, :text
    add_column :orders, :building, :text
    add_column :orders, :phone_number, :text
  end
end
