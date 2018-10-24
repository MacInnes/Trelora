class AddressSearch
  #def initialize(filter = {})
  #   @email = filter[:email]
  #   @password = filter[:password]
  # end

  def find_address(address, auth_token)
    address_data = service.find_address(address, auth_token)
    if address_data[:success] == true
      address_data[:result]
    else
      # TODO: invalid auth handling
    end
  end

  private

  def service
    TreloraService.new
  end

end
