require 'open-uri'
require 'net/http'

class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[show edit update]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @reviews = @cocktail.reviews.reverse
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end
end
