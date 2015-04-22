class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ensure_signup_complete, only: [:new, :create, :update, :destroy]
  before_action :authenticate_user!

  protected

  def ensure_signup_complete
    return if action_name == "finish_signup"

    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :email]
    devise_parameter_sanitizer.for(:account_update) << [:name, :email]
  end
end
