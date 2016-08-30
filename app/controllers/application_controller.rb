class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #include Pundit
    #  protect_from_forgery

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

#  def authentication_required
#    if !logged_in
#      redirect_to login_path
#    end
#  end
#
#  def logged_in
#    !!current_user
#    #session[:user_id]
#  end
#
#  def current_user
#    @current_user ||= User.find(session[:user_id]) if session[:user_id]
#  end
#
#  helper_method :current_user


end
