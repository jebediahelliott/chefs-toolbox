class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]


  def index
    @ingredients = Ingredient.all
    render json: @ingredients
  end

  def new
    @ingredient = Ingredient.new
    render json: @ingredient
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    render json: @ingredient, status: 201
  end

  def update
    @ingredient.update(ingredient_params)
    render json: @ingredient
  end

  def edit

  end

  def show
    render json: @ingredient
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
