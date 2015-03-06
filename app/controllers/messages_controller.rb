class MessagesController < ApplicationController
	def new
 	end
 
  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end

  def show
  	@messages_count = current_user.mailbox.inbox({:read => false}).count
  end
end
