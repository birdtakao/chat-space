class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.create
  end

  def create
    @message = Message.new(create_message)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージを投稿しました'
    else
      redirect_to :back, alert: 'メッセージを入力してください'
    end

  end

  private
  def create_message
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
