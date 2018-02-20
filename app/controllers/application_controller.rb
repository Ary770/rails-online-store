class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to access this page."
    redirect_to root_path
  end
end
