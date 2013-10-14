class UsersController < ApplicationController
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
  
end
