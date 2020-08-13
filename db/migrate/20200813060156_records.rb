class Records < ActiveRecord::Migration[6.0]
  def chang
    drop_table :users
  end
end
