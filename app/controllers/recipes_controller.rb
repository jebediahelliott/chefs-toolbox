class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :update, :destroy, :edit]
  def new
    @recipe = Recipe.new(user_id: params[:user_id])
    5.times do
      @recipe.amounts.build
      @recipe.amounts.last.build_ingredient
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      redirect_to new_recipe_path
    end
  end

  def edit

  end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def show

  end

  def destroy
    Recipe.find(params[:id]).delete
    redirect_to user_path(params[:user_id])
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end


  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :method, :notes, amounts_attributes: [:ingredient_amount, ingredient_attributes: [:name, :unit]])
  end

end
