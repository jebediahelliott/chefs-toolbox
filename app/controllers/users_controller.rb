class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy, :edit]
  def new
    @user = User.new
    render :layout => "sessions"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def edit

  end

  def update

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
