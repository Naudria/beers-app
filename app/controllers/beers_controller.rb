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
    # @comment = @beer.comments.build
    respond_to do |f|

      f.json {render json: @beer}
      f.html
    end
  end

  def new
    @beer = Beer.new
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user_id = current_user.id

    if @beer.save
      respond_to do |f|
        f.html { redirect_to beers_path }
        f.json { render json: @beer }
      end
    else
      render 'new'

    end
  end

  def next
    @next_beer = @beer.next
    render json: @next_beer
  end


  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    if @beer.update(beer_params)
      render json: @beer
    else
      render :edit
    end
  end

  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to beers_url, notice: 'Beer was successfully deleted.' }
      format.json { render json: @beers }
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
