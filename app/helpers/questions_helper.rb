module QuestionsHelper
  def question_header(question)
    title = question.new_record? ? 'Create new' : 'Edit'
    title << " #{question.test.title} question"
  end
end
