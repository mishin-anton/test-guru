class AddAllTablesNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :categories, :title, null: false

    change_column_null :tests, :title, null: false
    change_column_null :tests, :level, null: false
    change_column_null :tests, :category, null: false

    change_column_null :questions, :body, null: false
    change_column_null :questions, :test, null: false

    change_column_null :answers, :body, null: false
    change_column_null :answers, :question, null: false

    change_column_null :users, :name, null: false
  end
end
