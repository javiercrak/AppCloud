class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  protected

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to :action => "home", :controller=>"pages"
  end

end
