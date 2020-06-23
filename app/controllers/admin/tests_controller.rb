class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: [:show, :edit, :update, :destroy, :start, :update_inline]
  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index

  end

  def new
    @test = Test.new(author_id: current_user.id)
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.user_test(@test)
  end

  private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execution time: #{finish * 1000}ms")
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

end
