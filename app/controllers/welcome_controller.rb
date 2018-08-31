class WelcomeController < ApplicationController
  
  	def hello
  		if user_signed_in?
	  		current_user.DesideredBook.each do |book|
	  			@suggest = ProposedBook.where(["nome LIKE ?","%#{book.nome}%"])
	  		end
	  	end
  	end

  	def userssearch
		@users = User.search(params[:search])
  	end

	def hello_params
	  	params.require(:hello).permit(:username)
	end

end
