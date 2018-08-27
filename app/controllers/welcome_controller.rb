class WelcomeController < ApplicationController
  
  	def hello
  	end

  	def userssearch
		@users = User.search(params[:search])
  	end

	def hello_params
	  	params.require(:hello).permit(:username)
	end

end
