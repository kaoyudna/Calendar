class ApplicationController < ActionController::Base

  def after_sign_up_path(resource)
    schedules_month_path
  end

  def after_sign_in_path(resource)
    schedules_month_path
  end

end
