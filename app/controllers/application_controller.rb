class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :resolve_layout

  private

  def resolve_layout
    if devise_controller? && resource_name == :user
      'sign_in'
    else
      'application'
    end
  end

  def after_sign_in_path_for(resource)
    authenticated_root_path
  end
end
