class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:id])
  end

  def current_address
    if session[:address]
      session[:address].gsub(/[_-]/, ' ')
    else
      "No address selected"
    end
  end
end
