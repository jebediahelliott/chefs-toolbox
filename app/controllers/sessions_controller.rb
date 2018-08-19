class SessionsController < ApplicationController
  def new
  end

  def create
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
      end
      session[:id] = @user.id
      redirect_to user_path(@user)
    elsif !auth
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        redirect_to @user
      else
        redirect_to root_path
      end
    end
  end

  def destroy
    session.delete :id
    redirect_to root_path
  end

  private

  def auth
   request.env['omniauth.auth']
  end
end
