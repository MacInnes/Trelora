class MemberSearch

  def find_member(member_params)
    service.find_member(member_params)
  end

  private

  def service
    TreloraService.new
  end

end
