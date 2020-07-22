class AddCountToBagePassages < ActiveRecord::Migration[6.0]
  def change
    add_column :bage_passages, :count, :integer, default: 1
  end
end
