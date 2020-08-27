class RemovePriceFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :price, :integer
  end
end
