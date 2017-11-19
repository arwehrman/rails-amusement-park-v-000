class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin?, :ride

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def authenticated
      if logged_in?
      else
        redirect_to welcome_path
      end
    end

    def admin?
      !!current_user.admin
    end

    def ride
      current_user.take_ride
      @ride = Ride.create(user: current_user,)
    end
end
