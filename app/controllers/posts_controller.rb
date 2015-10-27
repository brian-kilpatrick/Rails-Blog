class PostsController < ApplicationController
  def index
    current_user
    @posts = Post.all
  end 

  def new
  	if current_user
      current_user
  		  @post = Post.new
  	else
  		redirect_to '/login'
  	end
  end

  def create
  	current_user
  	@post = current_user.posts.new(post_params)

  	if @post.save
  		flash[:notice] = "Your post was successfully created!"
  		redirect_to root_path
      # user_post_path(@current_user, @current_user.posts.last.id)
  	else
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def edit

    # if current_user.id == params[:id]
  end

  private

  def post_params
  	params.require(:post).permit(:title, :content)
  end
end
