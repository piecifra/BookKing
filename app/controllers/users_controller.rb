class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def search
		@users = User.where(["username LIKE ?","%#{params[:search]}%"])
	end
	
end
