class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    member_search = MemberSearch.new
    member = member_search.find_member(user_params)
    user = User.create(name: member[:user][:name], email: member[:user][:email], auth_token: member[:user][:HTTP_AUTH_TOKEN])
    if user.save
      session[:id] = user.id
      redirect_to "/address"
    else
      # TODO: handle invalid login
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
