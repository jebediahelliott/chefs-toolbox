class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy, :edit]
  def new
    @user = User.new
    render :layout => "sessions"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def show
    
  end

  def destroy

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
