class ConversationsController < ApplicationController
	before_action :get_mailbox
  	before_action :get_conversation, except: [:index]

	def index
    @conversations = @mailbox.inbox
    @messages_count = current_user.mailbox.inbox({:read => false}).count
  end
 
  def show
    @conversation.mark_as_read(current_user)
    @messages_count = current_user.mailbox.inbox({:read => false}).count
  end

  def reply
	current_user.reply_to_conversation(@conversation, params[:body])
	flash[:success] = 'Reply sent'
	redirect_to conversation_path(@conversation)
  end

  def destroy
    @conversation.move_to_trash(current_user)
    redirect_to conversations_path
  end
 
  private
 
  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
	
  def get_mailbox
    @mailbox ||= current_user.mailbox
  end


end
