class UsersController < ApplicationController

	def new
	  @user = User.new
	end

	def create
	  @user = User.new(params[:user])

	  if @user.save
	  	flash[:success] = "Your account has been created"
	    redirect_to @user
      else
      	flash.now[:error] = "no dice!"
      	render 'new'
      end
	end

end
