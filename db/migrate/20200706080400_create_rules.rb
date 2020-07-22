class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.string :title

      t.timestamps
    end
    add_index :rules, :title, unique: true
  end
end
