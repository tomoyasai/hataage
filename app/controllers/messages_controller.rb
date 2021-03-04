class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :edit, :update, :check_user]
  before_action :check_user, only: [:edit, :update]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def show
    @count=@message.likes.length
  end

  def edit 
  end

  def update
    if @message.update(message_params)
      redirect_to message_path(@message), notice: '投稿内容が編集されました'
    else
      flash.now[:alert] = '必要項目を入力してください'
      render :edit
    end
  end

  def destroy
    message = Message.find(params[:id]) 
    if current_user.id == message.user.id
      message.destroy
      redirect_to root_path
    else 
      redirect_to message_path(message.id)
    end
  end

  def search
    @messages = Message.search(params[:keyword])
  end
  

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      redirect_to root_path, notice: 'メッセージが送信されました'
    else
      flash.now[:alert] = '必要項目を入力してください'
      render "new"
    end
  end


  private
  def message_params
    params.require(:message).permit(:title, :content, :image,:category_id).merge(user_id: current_user.id)
  end

  def find_message
    @message = Message.find(params[:id])  
  end

  def check_user
    if @message.user_id != current_user.id
      redirect_to action: :index
    end
  end

end
