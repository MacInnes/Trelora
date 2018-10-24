class MemberSearch

  def find_member(email, password)
    member_data = service.find_member(email, password)
    if member_data[:status] == 200
      member_data[:data]
    else
      # TODO: invalid auth handling
    end
  end

  private

  def service
    TreloraService.new
  end

end
