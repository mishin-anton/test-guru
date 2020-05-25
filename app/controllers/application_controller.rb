class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

  def admin_required!
    redirect_to after_sign_in_path_for(:admin), alert: 'You are not authorized to view this page.' unless current_user.is_a?(Admin)
  end

end
