class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.date :date
      t.text :content

      t.timestamps
    end
  end
end
