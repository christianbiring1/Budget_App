class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: %i[home]
  before_action :update_allowed_paremeters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    user_groups_path(current_user.id)
  end

  protected

  def update_allowed_paremeters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
