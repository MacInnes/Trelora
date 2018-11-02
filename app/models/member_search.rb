class MemberSearch
  def find_member(email, password)
    member_data = service.find_member(email, password)
    member_data[:data] if member_data[:status] == 200
  end

  private

  def service
    TreloraService.new
  end
end
