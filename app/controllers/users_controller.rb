class UsersController < ApplicationController

  def index
    if current_user 
      
    else
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end
end
