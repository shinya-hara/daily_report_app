class AddIndexToReport < ActiveRecord::Migration[5.1]
  def change
    remove_index :reports, :user_id
    add_index :reports, [:user_id, :date], unique: true
  end
end
