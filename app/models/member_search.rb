class MemberSearch

  def find_member(member_params)
    member_data = service.find_member(member_params)
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

  def format_member(member_data)
    Member.new(member_data)
  end

end
