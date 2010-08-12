class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to Fritter!"
      redirect_to @user
    else
      @title = "Sign up"
      @user.password.clear
      @user.password_confirmation.clear
      render 'new'
    end
  end

end
