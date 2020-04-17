class AddAuthorIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author_id, index: true
  end
end
