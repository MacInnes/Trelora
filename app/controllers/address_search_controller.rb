class AddressSearchController < ApplicationController

  def new

  end

  def show
    search = AddressSearch.new
    @address_facade = AddressFacade.new(params[:address], current_user.HTTP_AUTH_TOKEN)
  end

end
