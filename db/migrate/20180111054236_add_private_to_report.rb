class AddPrivateToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :private, :boolean, default: false
  end
end
