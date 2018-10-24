class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    member_search = MemberSearch.new
    member = member_search.find_member(params[:email], params[:password])
    redirect_to "/address"
  end

end
