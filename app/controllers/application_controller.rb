class ApplicationController < ActionController::Base
  after_action :after_login, only: :create
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_login
    flash[:notice] = "Welcome back, #{current_user.name}!"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  end
end
