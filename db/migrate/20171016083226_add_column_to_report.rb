class AddColumnToReport < ActiveRecord::Migration[5.1]
  def change
    add_reference :reports, :user, foreign_key: true
    remove_column :reports, :title, :string
    add_column :users, :username, :string, :after => :id
  end
end
