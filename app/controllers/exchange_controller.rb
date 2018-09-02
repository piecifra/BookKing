class ExchangeController < ApplicationController
  def create

		@exchange = Exchange.new(exchange_params)
		@exchange.save

  end

  def new
  	@exchange = Exchange.new
  end

  def index
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_params
      params.require(:exchange).permit(:mittente_id, :libromittente, :destinatario_id, :librodestinatario)
    end
end