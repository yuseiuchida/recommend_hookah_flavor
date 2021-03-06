class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to login
  end
end
