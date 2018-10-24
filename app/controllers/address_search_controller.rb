class AddressSearchController < ApplicationController

  def new

  end

  def show
    @address_facade = AddressFacade.new(params[:address], current_user.HTTP_AUTH_TOKEN)
  end

end
