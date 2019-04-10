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

  # GET /beers/1
  # GET /beers/1.json
  def show
    @comments = @beer.comments
    @comment = Comment.new # @beer.comments.build
    @beer = Beer.find(params[:id])
    respond_to do |f|
      f.html
      f.json { render json: @beer}
    end
  end

  def next
    @next_beer = @beer.next
    render json: @next_beer

  end

  # GET /beers/new
  def new
    @beer = Beer.new
  end

  # GET /beers/1/edit
  def edit
    @beer = Beer.find(params[:id])
  end

  # POST /beers
  # POST /beers.json
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

  # PATCH/PUT /beers/1
  # PATCH/PUT /beers/1.json
  def update
    if @beer.update(beer_params)
      redirect_to @user
    else
      render :edit
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to beers_url, notice: 'Beer was successfully destroyed.' }
      format.json { head :no_content }
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
