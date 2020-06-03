class UserTestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user_test, only: %i[show update result gist]

  def update
    @user_test.accept!(params[:answer_ids])

    if @user_test.completed?
      TestsMailer.completed_test(@user_test).deliver_now
      redirect_to result_user_test_path(@user_test)
    else
      render :show
    end
  end

  def result

  end

  def gist
    result = GistQuestionService.new(@user_test.current_question).call
    link_to_gist = result.html_url

    flash_options = if result.html_url.present?
      { notice: t('.success', gist_link: link_to_gist) }
    else
      { alert: t('.failure') }
    end

    gist_data = {
      question: @user_test.current_question,
      user: current_user,
      gist_message: result.id
    }

    Gist.create gist_data

    redirect_to @user_test, flash_options
  end

  def destroy
    set_current_question_number
  end

  private

  def set_user_test
    @user_test = UserTest.find(params[:id])
  end

end
