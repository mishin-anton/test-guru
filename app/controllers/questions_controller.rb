class QuestionsController < ApplicationController
  before_action :find_test, only: [:new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test_id: params[:test_id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    # @question = Question.new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
     Question.destroy(params[:id])
     redirect_to root_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:id, :body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
