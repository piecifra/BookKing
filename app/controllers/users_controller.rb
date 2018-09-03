class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def search
		ricerca = params['ricerca']
		@users = User.where([ricerca + " LIKE ?","%#{params[:search]}%"])
	end
	
end
