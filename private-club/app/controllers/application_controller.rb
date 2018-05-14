class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  before_action :require_login

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to signup_url # halts request cycle
    end
  end

end
