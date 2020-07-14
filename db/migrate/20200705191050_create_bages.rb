class CreateBages < ActiveRecord::Migration[6.0]
  def change
    create_table :bages do |t|
      t.string :name
      t.string :img_filename
      t.string :rule

      t.timestamps
    end
  end
end
