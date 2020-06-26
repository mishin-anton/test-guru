class TestsMailer < ApplicationMailer
  def completed_test(user_test)
    @user = user_test.user
    @test = user_test.test

    # mail to: @user.email
    mail to: 'coal.msk@gmail.com'
  end
end
