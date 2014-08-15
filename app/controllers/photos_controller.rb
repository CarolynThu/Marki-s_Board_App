class PhotosController < ApplicationController
  before_action :login, :signup
  def index
    @photos = Photo.all
  end

  def new
    if current_user && current_user.is_admin
      @photo = Photo.new
    else
      redirect_to global_path
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

 def create
  if current_user.is_admin
    @photo = Photo.new(photo_params)
  end
  if @photo.save
    redirect_to global_path
  else
    render 'new'
  end
 end

def login
    @user_login = User.new
    @is_login = true
  end

  def signup
    @user_signup = User.new
  end

private

  def photo_params
    params.require(:photo).permit(:image)
  end

end

#   def new
#     @photo =Photo.new
#   end

