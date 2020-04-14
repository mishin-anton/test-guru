class AddProgressToUserTests < ActiveRecord::Migration[6.0]
  def change
    add_column :user_tests, :progress, :integer, default: 0
  end
end
