class AddDutationToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :duration, :integer
  end
end
