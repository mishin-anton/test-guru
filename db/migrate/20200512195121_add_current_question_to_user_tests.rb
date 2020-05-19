class AddCurrentQuestionToUserTests < ActiveRecord::Migration[6.0]
  def change
    add_column :user_tests, :current_question_id, :integer
  end
end
