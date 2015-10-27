class UsersController < ApplicationController
  def index
    # sign in form
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id 
  		session[:username] = @user.username
  		flash[:notice] = "You have successfully signed up!"
  		redirect_to @user
  	else
  		flash[:notice] = "Something went wrong, please try again!"
  		render new_user_path
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  private

  def user_params
  	params.require(:user).permit(:fname, :lname, :location, :password, :password_confirmation, :username)
  end
end
