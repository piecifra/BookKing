class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@reviews = @user.UserReviews.all
	end

	def search
	    @ricerca = 'nome'
	    if params['ricerca'] != nil
	    	@ricerca = params['ricerca']
	    end
	    @value = ''
	    if params[:search_user] != nil
	    	@value = params[:search_user]
	    end
	    ascdesc = ' ASC'
	    ord = 'username'
	    if params['Ordina'] != nil
	      ord = params['Ordina']
	      if params['AscDesc'] == 'decrescente'
	        ascdesc = ' DESC'
	      end
	    end
	    puts ord + ascdesc
	    @users = User.where([@ricerca + " LIKE ?","%#{@value}%"]).order(ord + ascdesc)

	end
	
end
