class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like

  def create
      user = current_user
      message = Message.find(params[:message_id])
      like = Like.create(user_id: user.id, message_id: message.id)
  end
  def destroy
      user = current_user
      message = Message.find(params[:message_id])
      like = Like.find_by(user_id: user.id, message_id: message.id)
      like.delete
  end

  private
  def set_like
      @message =Message.find(params[:message_id])
  end
end
