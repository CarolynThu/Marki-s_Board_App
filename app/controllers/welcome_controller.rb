class WelcomeController < ApplicationController
  before_action :login
  def index
  end

  def about
  end

  def login
    @user_login = User.new
    @is_login = true
  end
end