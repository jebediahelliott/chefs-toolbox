class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to @user
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete :id
    redirect_to root_path
  end
end
