class BoardsController < ApplicationController
  def index
    if current_user && current_user.is_admin
    else
      redirect_to new_session_path
    end
  end

end
