class RepliesController < ApplicationController
  before_action :authenticate_user!

	def create
		@post_comment = PostComment.find(params[:post_comment_id])
		@reply = Reply.new(reply_params)
		@reply.post_comment_id = @post_comment.id
		@reply.user_id = current_user.id
		if @reply.save
  		redirect_to request.referer
		else
		  render 'pets/show'
		end
	end

	def destroy
		@post_comment = PostComments.find(params[:post_comment_id])
  	    reply = @post_comment.reply.find(params[:id])
		reply.destroy
		redirect_to request.referer
	end

	private
	def reply_params
		params.require(:reply).permit(:comment)
	end
end