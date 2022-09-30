class ApplicationController < ActionController::Base
  # Before calling this, first authenticate user.
  before_action :authenticate_user!

  # Given in the configuarion.
  before_action :configure_permitted_parameters, if: :devise_controller?

  # it is private becuase only this class need it.
  # we dont not want any one to bypass the allowed attribuutes.
  private

  # Which parameters will be permitted.
  def configure_permitted_parameters
    default_parameters = %i[name bio photo password]
    devise_parameter_sanitizer.permit(:sign_up, keys: default_parameters)
    devise_parameter_sanitizer.permit(:sign_in, keys: default_parameters)
    devise_parameter_sanitizer.permit(:account_update, keys: default_parameters)
  end
end
