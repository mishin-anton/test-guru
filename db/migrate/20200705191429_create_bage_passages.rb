class CreateBagePassages < ActiveRecord::Migration[6.0]
  def change
    create_table :bage_passages do |t|
      t.belongs_to :user
      t.belongs_to :bage

      t.timestamps
    end
  end
end
