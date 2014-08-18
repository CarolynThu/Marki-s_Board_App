class UsersController < ApplicationController
before_action :login, :signup


  def index
    if current_user 

    else
      redirect_to new_user_path
    end
  end

  

  def show
    @user = User.find(params[:id])
    @boards = current_user.boards.all
    @board = current_user.boards.new
  end


  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to user_path(@user)
    else
      redirect_to main_path
    end
  end

  def edit
    if current_user && current_user.id == User.find(params[:id]).id
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation))
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    reset_session
    User.find(params[:id]).destroy
    redirect_to main_path
  end

   def login
    @user_login = User.new
    @is_login = true
  end

  def signup
    @user_signup = User.new
  end
end
