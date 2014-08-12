class BoardsController < ApplicationController
  def index
    if current_user && current_user.is_admin
    else
      redirect_to new_session_path
    end
  end

  def show
    # @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    if !current_user 
      alert("You must be signed-in for this feature")
      redirect_to new_session_path
    else
      @board = Board.new(params.require(:board).permit(:name, :type, :description))
      if @board.save
        redirect_to user_path(current_user)
      else 
        render 'new'
      end 
    end
    
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(params.require(:board).permit(:name, :type, :description))
      redirect_to boards_path
    else
      render 'edit'
    end
  end

  def destroy
    @board = Board.find(parms [:id])
    @board.destory
  end 
end


