class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new(comment_params)
  	@comment.user_id = session[:user_id]
  	if @comment.save
  		flash[:message] = "Comment Successfully Posted"
  		redirect_to :back
  	else
  		flash[:message] = "Something Went Wrong"
  	end
  end

  private 

  def comment_params
  	params.permit(:content, :post_id)
  end
end
