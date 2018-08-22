class WelcomeController < ApplicationController
  
  	def hello
  		if params[:username]
    		@users = User.where('username LIKE ?', "%#{params[:username]}%")
  		else
    		@users = User.all
		end
  	end

	def hello_params
	  	params.require(:hello).permit(:username)
	end

end
