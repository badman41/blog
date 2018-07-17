class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      respond_to do |format|
        format.html{redirect_to @comment.entry}
        format.js
      end
    else
      @feed_items = []
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :entry_id
  end
end
