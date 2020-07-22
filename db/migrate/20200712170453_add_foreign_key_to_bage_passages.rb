class AddForeignKeyToBagePassages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bage_passages, :users
  end
end
