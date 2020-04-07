class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :categories, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
