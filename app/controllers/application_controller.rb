class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :find_addresses

  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

  def current_address
    session[:formatted_address] if session[:formatted_address]
  end

  def find_addresses
    session[:addresses].map do |address_data|
      Address.new(address_data)
    end
  end

  def confirm_address_exists
    unless session[:address]
      flash[:error] = 'We lost your address! Please enter a new one'
      redirect_to '/find'
    end
  end

  def logged_in?
    unless current_user
      flash[:error] = 'Please log in to access more content.'
      redirect_to '/'
    end
  end
end
