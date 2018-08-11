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
    if valid_ingredients(@recipe) && @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    2.times do
      @recipe.amounts.build
      @recipe.amounts.last.build_ingredient
    end
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

  def valid_ingredients(recipe)
    recipe.amounts.all? do |amount|
      amount.ingredient.save
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :method, :notes, amounts_attributes: [:ingredient_amount, ingredient_attributes: [:name, :unit]])
  end

end
