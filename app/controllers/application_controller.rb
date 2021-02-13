class ApplicationController < ActionController::Base
  include SessionsHelper

  def authorize
    redirect_to login_path, alert: 'Not Authorised ' if current_user.nil?
  end
  
  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
