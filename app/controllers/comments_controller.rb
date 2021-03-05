class CommentsController < ApplicationController
  def create
    # comment = Comment.create(comment_params)
    # redirect_to "/messages/#{comment.message.id}"
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to message_path(params[:message_id])  }
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, message_id: params[:message_id])
  end
end