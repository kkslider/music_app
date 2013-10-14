class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params["user"])
    
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
end
