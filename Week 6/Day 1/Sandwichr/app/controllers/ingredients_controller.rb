class IngredientsController < ApplicationController
  before_action :find_ingredient, only: :show

  def create
    sandwich = Sandwich.find_by(id: params[:sandwich_id])
    ingredient = Ingredient.find_by(name: params[:name])
    if !ingredient
      render json: {error: 'ingredient not found'}, status: 404
      return
    elsif !sandwich
      render json: {error: 'sandwich not found'}, status: 404
      return
    elsif sandwich.ingredients.include?(ingredient)
      render json: {error: 'sandwich already has that ingredient'}, status: 404
      return
    end
    sandwich.ingredients.push(ingredient)
    render json: sandwich.ingredients
  end

  def index
    ingredients = Sandwich.find(params[:sandwich_id]).ingredients
    render json: ingredients
  end

  def show
    render json: @ingredient
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
    unless @ingredient
      render json: {error: 'ingredient not found'}, status: 404
      return
    end
  end
end
