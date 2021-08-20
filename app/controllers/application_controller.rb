class ApplicationController < ActionController::Base
  before_action :set_locale
  after_action :after_login, only: :create
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    {lang: (I18n.locale unless I18n.locale == I18n.default_locale)}
  end

  protected

  def after_login
    flash[:notice] = "Welcome, #{current_user.name}!"
  end

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
