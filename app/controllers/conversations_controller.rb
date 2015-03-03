class ConversationsController < ApplicationController
	helper_method :mailbox, :conversation

	def index
		@conversations = @mailbox.inbox.all
	end

	def reply
 	current_user.reply_to_conversation(conversation, params[:body])
 	redirect_to conversation_path(@conversation)
	end

	def trashbin
		@trash ||= current_user.mailbox.trash.all
	end

	def trash
		conversation.move_to_trash(current_user)
		redirect_to :conversations
	end

	def untrash
		conversation.untrash(current_user)
		redirect_to :back
	end

	def empty_trash
		current_user.mailbox.trash.each do |conversation|
			conversation.receipts_for(current_user).update_all(:deleted => true)
		end
		redirect_to :conversations
	end

	private

	def mailbox
		@mailbox ||= current_user.mailbox
	end

	def conversation
 	@conversation ||= mailbox.conversations.find(params[:id])
	end
end
