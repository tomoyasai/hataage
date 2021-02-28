class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])  
  end

  def edit
    @message = Message.find(params[:id])  
  end

  def update
    @message = Message.find(params[:id])  
    if @message.update(message_params)
      redirect_to message_path(@message), notice: '投稿内容が編集されました'
    else
      flash.now[:alert] = '必要項目を入力してください。'
      render :edit
    end
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
