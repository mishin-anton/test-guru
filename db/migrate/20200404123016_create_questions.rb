class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body
      t.references :test_id, index: true

      t.timestamps
    end
  end
end
