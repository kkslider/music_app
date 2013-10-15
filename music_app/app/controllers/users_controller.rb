class UsersController < ApplicationController
  before_filter :require_logged_in!
  
  def new
    render :new
  end
  
  def create
    @user = User.new(params["user"])
    
    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  private
  
  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end
end
