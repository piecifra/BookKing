class Proposal < ApplicationRecord
  belongs_to :mittente, :class_name => 'User'
  belongs_to :libromittente, :class_name => 'ProposedBook'
  belongs_to :destinatario, :class_name => 'User'
  belongs_to :librodestinatario, :class_name => 'ProposedBook'
  validates :mittente, :destinatario, :libromittente, :librodestinatario, presence: true

  validate :mittente_destinatario
  validate :librom_librod


  def mittente_destinatario
  	if mittente == destinatario
  		errors.add(:domain, "Gli utenti devono essere diversi")
  	end
  end

  def librom_librod
  	if librodestinatario == libromittente
  		errors.add(:domain, "I libri devono essere diversi")
  	end
  end
end
