class PostCommentsController < ApplicationController
  before_action :authenticate_user!

	def create
		@pet = Pet.find(params[:pet_id])
		@post_comment = PostComment.new(post_comment_params)
		@post_comment.pet_id = @pet.id
		@post_comment.user_id = current_user.id
		if @post_comment.save
  		redirect_to request.referer
		else
		  render 'pets/show'
		end
	end

	def destroy
		@pet = Pet.find(params[:pet_id])
  	    post_comment = @pet.post_comments.find(params[:id])
		post_comment.destroy
		redirect_to request.referer
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
