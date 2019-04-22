class CommentsController < ApplicationController

  def index
    if params["beer_id"]
      @beer = Beer.find(params["beer_id"])
      @comments = Comment.all.where(beer_id: params["beer_id"])

      respond_to do |format|
        format.html
        format.json {render json: @comments}
      end
    else
      @comments = Comment.all
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @comments}
      end
    end
  end

  def show
    @comment = Comment.find(params["id"])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @comment}
    end
  end


  def new
    @beer = Beer.find(params["beer_id"])
    @comment = @beer.comments.build
  end

  def create
    @beer = Beer.find(params["beer_id"])
    @comment = @beer.comments.build
    if @comment.update(comment_params)
      respond_to do |format|
        format.html {redirect_to beer_path(@beer)}
        format.json {render json: @comment}
      end
    else
      flash.now[:message] = @comment.errors[:content][0]
      render :new
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:beer_id, :content)
  end
end
