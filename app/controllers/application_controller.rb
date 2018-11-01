class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :find_addresses

  def current_user
    @user ||= User.find(session[:id])
  end

  def current_address
    if session[:formatted_address]
      session[:formatted_address]
    else
      "No address selected"
    end
  end

  def find_addresses
    session[:addresses].map do |address_data|
      Address.new(address_data)
    end
  end
end
