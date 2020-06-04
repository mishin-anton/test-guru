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
    service = GistQuestionService.new(@user_test.current_question)
    response = service.call

    flash_options = if service.success?
      gist_url = response.html_url
      create_sucess_gist(gist_url)
      { notice: t('.success', gist_link: gist_url) }
    else
      { alert: t('.failure') }
    end

    redirect_to @user_test, flash_options
  end

  def destroy
    set_current_question_number
  end

  private

  def set_user_test
    @user_test = UserTest.find(params[:id])
  end

  def create_sucess_gist(url)
    current_user.gists.create(question: @user_test.current_question, gist_message: url)
  end

end
