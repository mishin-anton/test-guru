class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_or tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to tests_path
  end

  private

   def redirect_back_or(default)
    redirect_to(cookies[:forwarding_url] || default)
    cookies.delete(:forwarding_url)
  end


end
