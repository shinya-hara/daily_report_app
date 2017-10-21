class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :reports_count, :integer, defautl: 0
  end
end
