class Exchange < ApplicationRecord
  belongs_to :mittente, :class_name => 'User'
  belongs_to :destinatario, :class_name => 'User'
  validates :mittente, :destinatario, :libromittente, :librodestinatario, presence: true

  validate :mittente_destinatario


  private

  def mittente_destinatario
  	if mittente == destinatario
  		errors.add(:domain, "Gli utenti devono essere diversi")
  	end
  end
end

