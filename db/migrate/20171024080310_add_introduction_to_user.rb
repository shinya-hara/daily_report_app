class AddIntroductionToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :introduction, :text, limit: 200
    add_column :users, :belong_to, :string
    add_column :users, :location, :string
    add_column :users, :site, :string
  end
end
