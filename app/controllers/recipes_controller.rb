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
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def show

  end

  def index
    @item = params[:item]
    @recipes = Recipe.search(params[:item])
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
    params.require(:recipe).permit(:name, :item, :user_id, :method, :notes, amounts_attributes: [:ingredient_amount, :id, ingredient_attributes: [:name, :unit]])
  end

end
