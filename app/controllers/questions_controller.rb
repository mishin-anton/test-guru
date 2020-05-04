class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test_id: params[:test_id])
  end

  def show
    render inline: '<%= @question.id %>'
  end

  def create
    test = Test.find(params[:test_id])
    question = test.questions.create(question_params)

    if question.save
      render plain: question.inspect
    else
      render plain: "Error"
    end
  end

  def destroy
     Question.destroy(params[:id])
     redirect_to root_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:id, :body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
