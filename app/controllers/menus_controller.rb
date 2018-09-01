class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :update, :destroy, :edit]

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new(user_id: params[:user_id])
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to @menu
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def show
    @menu = Menu.find(params[:id])
  end

  def destroy

  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :user_id, :monday_lunch, :monday_dinner, :tuesday_lunch, :tuesday_dinner, :wednesday_lunch, :wednesday_dinner, :thursday_lunch, :thursday_dinner, :friday_lunch, :friday_dinner, :saturday_lunch, :saturday_diner, :sunday_lunch, :sunday_dinner)
  end

end
