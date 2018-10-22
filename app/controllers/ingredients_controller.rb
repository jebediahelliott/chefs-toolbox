class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]


  def index
    @ingredients = Ingredient.all
  end

  def inventory

  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params), status: 201
  end

  def update
    @ingredient.update(ingredient_params)
  end

  def edit

  end

  def show
  end

  def destroy
    @ingredient.delete
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit, :inventory_amount)
  end
end
