class SandwichesController < ApplicationController
  before_action :find_sandwich, only: [:show, :update, :destroy]

  def index
    sandwiches = Sandwich.all
    render json: sandwiches
  end

  def create
    sandwich = Sandwich.create sandwich_params
    render json: sandwich
  end

  def show
    render json: @sandwich
  end

  def update
    @sandwich.update(sandwich_params)
    render json: @sandwich
  end

  def destroy
    @sandwich.destroy
    render json: @sandwich
  end

  private

  def find_sandwich
    @sandwich = Sandwich.find_by(id: params[:id])
    unless @sandwich
      render json: {error: 'sandwich not found'}, status: 404
      return
    end
  end

  def sandwich_params
    params.require(:sandwich).permit(:name, :bread_type)
  end
end
