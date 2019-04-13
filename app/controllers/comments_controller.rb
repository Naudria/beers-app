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




  private
  def comment_params
    params.require(:comment).permit(:beer_id, :content)
  end
end
