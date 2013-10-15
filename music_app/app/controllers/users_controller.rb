class UsersController < ApplicationController
  # before_filter :require_logged_in!, except: [:new, :create]
  
  def new
    render :new
  end
  
  def create
    @user = User.new(params["user"])
    
    if @user.save
      login_user!(@user)
      msg = UserMailer.activation_email(@user)
      msg.deliver!
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
  
  def activate
    @user = User.find_by_activation_token(params["activation_token"])
    if @user
      login_user!(@user)
      @user.activated = true
      @user.save!
      redirect_to user_url(@user)
    end
  end
  
  private
  
  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end
end
