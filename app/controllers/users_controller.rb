class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy, :edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end

  def set_user
    @user = User.find(params[:id])
  end
end
