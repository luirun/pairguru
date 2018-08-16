class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.movie = Movie.find(params[:movie_id])
    @comment.user = current_user
    if @comment.save
      redirect_to @comment.movie, notice: 'Comment was successfully created.'
    else
      redirect_to root_path, alert: 'Some error occurred, comment not saved.'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to movie_url(params["movie_id"]), notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:user_id, :movie_id, :content)
    end
end
