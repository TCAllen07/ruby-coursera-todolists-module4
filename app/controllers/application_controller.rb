class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user
  before_action :ensure_login

  protected
    def logged_in?
      # !session[:user_id].nil?
      session[:user_id]
    end
    def current_user
      # if self.logged_in?
        # @current_user = User.find(session[:user_id])
      # end
      @current_user ||= User.find(session[:user_id])
    end
    def ensure_login
      redirect_to(login_path) unless session[:user_id]
    end

end
