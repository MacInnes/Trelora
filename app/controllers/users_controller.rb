class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    member_search = MemberSearch.new
    member = member_search.find_member(user_params)
    binding.pry
    redirect_to "/address"
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
