class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def after_sign_up_path_for(resource)
    registration_confirmation_path
  end
  
  def after_sign_in_path_for(resource)
    if current_instructor
      instructors_dashboard_path
    elsif current_student
      students_dashboard_path
    end
  end
  
  
end
