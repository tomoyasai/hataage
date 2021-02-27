class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def show
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      redirect_to root_path, notice: 'メッセージが送信されました'
    else
      flash.now[:alert] = '必要項目を入力してください。'
      render "new"
    end
  end

  private
  def message_params
    params.require(:message).permit(:title, :content, :image,:category_id).merge(user_id: current_user.id)
  end

end
