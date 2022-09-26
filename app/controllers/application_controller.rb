class ApplicationController < ActionController::Base
  # For selecting the currecnt user.
  def current_user
    @current_user = User.first
  end
end
