class AddressesController < ApplicationController

  def find

  end

  def show
    session[:address] = params[:address] unless params[:address].nil?
    @address_facade = AddressFacade.new(session[:address], current_user.HTTP_AUTH_TOKEN)
    if @address_facade.is_invalid?
      flash[:failure] = "Address Not Found"
      redirect_to '/find'
    end
  end

end
