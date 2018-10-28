class MemberSearch
  #def initialize(filter = {})
  #   @email = filter[:email]
  #   @password = filter[:password]
  # end

  def find_member(email, password)
    member_data = service.find_member(email, password)
    if member_data[:status] == 200
      member_data[:data]
    end
  end

  private

  def service
    TreloraService.new
  end

end
