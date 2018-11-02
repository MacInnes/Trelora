class AddressSearch
  def find_address(address, auth_token)
    address_data = service.find_address(address, auth_token)
    address_data[:result] if address_data[:success] == true
  end

  private

  def service
    TreloraService.new
  end
end
