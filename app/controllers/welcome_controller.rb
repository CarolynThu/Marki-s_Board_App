class WelcomeController < ApplicationController
  before_action :login, :signup
  def index
  end

  def about
  end

  def login
    @user_login = User.new
    @is_login = true
  end

  def signup
    @user_signup = User.new
  end
end