class WelcomeController < ApplicationController
  

  	def hello
  		if user_signed_in?
  			@ord = 'nome'
  			@ascdesc = ' ASC'
 			if params['Ordina'] != nil
 				@ord = params['Ordina']
  				if params['AscDesc'] == 'decrescente'
  					@ascdesc = ' DESC'
  				end
  			end
  			@suggest = ProposedBook.where('lower(nome) in (?)', current_user.DesideredBook.select('lower(nome)')).order(@ord + @ascdesc)
	  	end
  	end

  	def userssearch
		@users = User.search(params[:search])
  	end

  	private

		def hello_params
		  	params.require(:hello).permit(:username)
		end

end
