class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :update, :destroy, :edit]
  def new
    @recipe = Recipe.new(user_id: params[:user_id])
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

  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy

  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :user_id)
  end

end
