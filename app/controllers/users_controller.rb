class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def search
	    @ricerca = params['ricerca']
	    @value = params[:search]
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
