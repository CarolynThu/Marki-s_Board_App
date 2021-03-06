class BoardsController < ApplicationController
  before_action :login, :signup

  def index
    if current_user && current_user.is_admin
      @boards = Board.all
    else
      redirect_to new_session_path
    end
    @photo = Photo.new
  end

  def global
    @photos = Photo.all
  end


  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    if !current_user 
      alert("You must be signed-in for this feature")
      redirect_to new_session_path
    else
      @board = current_user.boards.new(params.require(:board).permit(:name, :type, :description))
      if @board.save
        redirect_to user_path(current_user)
      else 
        render 'new'
      end 
    end
    
  end

  def edit
    if current_user # && current_user.id == User.find(params[:id]).id
      @board = Board.find(params[:id])
  
    else
      redirect_to root_path
    end
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(params.require(:board).permit(:name, :type, :description))
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    # if current_user
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to user_path(current_user)
    # else
      # @board = Board.find(params[:id])
      # @board.destroy
      # redirect_to boards_path
    end
  end 

# function added to for admin to delete boards.
  # def admin_delete
  #   @admin_board = Board.find(params[:id])
  #   @admin_board.destroy
  # end

  def login
    @user_login = User.new
    @is_login = true
  end
  
  def signup
    @user_signup = User.new
  end



