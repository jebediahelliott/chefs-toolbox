class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :update, :destroy, :edit]

  def index
    if params[:user_id]
      @menus = User.find(params[:user_id]).menus
    else
      @menus = Menu.all
    end
  end

  def new
    @menu = Menu.new(user_id: params[:user_id])
  end

  def create
    @menu = Menu.new(menu_params)
    binding.pry
    if @menu.save
      redirect_to @menu
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @menu.update(menu_params)
      redirect_to @menu
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    Menu.find(params[:id]).delete
    redirect_to user_path(params[:user_id])
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:menu_date, {:recipe_ids => []}, :user_id, :monday_lunch, :monday_dinner, :tuesday_lunch, :tuesday_dinner, :wednesday_lunch, :wednesday_dinner, :thursday_lunch, :thursday_dinner, :friday_lunch, :friday_dinner, :saturday_lunch, :saturday_dinner, :sunday_lunch, :sunday_dinner)
  end

end
