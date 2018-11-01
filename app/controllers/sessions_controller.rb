class SessionsController < ApplicationController
  def new; end

  def create
    member_search = MemberSearch.new
    member = member_search.find_member(params[:email], params[:password])
    if member
      user = User.find_by(HTTP_AUTH_TOKEN: member[:user][:HTTP_AUTH_TOKEN])
      if user
        user.update(member[:user])
      else
        user = User.create(member[:user])
      end
      session[:id] = user.id
      redirect_to '/find'
    else
      flash.now[:notice] = 'Invalid login information.'
      render :new
    end
  end
end
