class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params["user"]["email"], params["user"]["password"])
    
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @user = User.find_by_session_token(session[:session_token])
    logout_user!(@user)
  end
end
