class ProposalsController < ApplicationController

	def new
		@proposal = Proposal.new
	end

	def create
		@proposal = Proposal.new(proposal_params)
		@proposal.save
		redirect_to root_path
	end

	def index
			@proposal = Proposal.where(:destinatario_id => current_user.id )
			@exchange = Exchange.where(:destinatario_id => current_user.id ).or(Exchange.where(mittente_id: current_user))
	end

	def accetta
		@p = Proposal.find(params[:proposal_id])
		@b1 = User.find(@p.mittente.id).ProposedBook.find(@p.libromittente.id)
		@b2 = User.find(@p.destinatario.id).ProposedBook.find(@p.librodestinatario.id)
		param = {'mittente_id' => @p.mittente.id, 
				'destinatario_id' => @p.destinatario.id, 
				'libromittente' => @p.libromittente.nome, 
				'librodestinatario' => @p.librodestinatario.nome}
		@e = Exchange.new(param)
		@e.save
		@b1.destroy
		@b2.destroy
		@p.destroy
	    redirect_to root_path
	end

	def rifiuta
		@p = Proposal.find(params[:proposal_id])
		@p.destroy
		redirect_to root_path
	end
	
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:proposal_id, :mittente_id, :libromittente_id, :destinatario_id, :librodestinatario_id)
    end

end