class AddIndexToReport < ActiveRecord::Migration[5.1]
  def change
    add_index :reports, [:user_id, :date], unique: true
    remove_index :reports, :user_id
  end
end
