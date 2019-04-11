class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy, :next]
  before_action :set_user, only: [:show, :edit, :update, :index]

  # GET /beers
  # GET /beers.json
  def index
    @beers = Beer.all
    respond_to do |f|
      f.html
      f.json { render json: @beers}
    end
  end

  def show
    @comment = @beer.comments.build
    respond_to do |f|
      f.html
      f.json {render json: @beer}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_beer
    @beer = Beer.find(params[:id])
  end

  def set_user
    @user = current_user
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def beer_params
    params.require(:beer).permit(:name, :brewery, :abv, :review)
  end
end
