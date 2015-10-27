class SessionsController < ApplicationController
	def new
		# Log-In form
	end

	def create
		@user = User.where(username: params[:username]).first

	    if @user && @user.authenticate(params[:password])
	      flash[:notice] = "Hey #{@user.fname}, You are logged in!"
	      session[:user_id] = @user.id
	      redirect_to root_path
	    else
	      flash[:alert] = "Username or Password is Invalid!"
	      render('new')
	    end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have been signed out."
		redirect_to root_path
	end
end
