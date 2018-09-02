class Proposal < ApplicationRecord
  belongs_to :mittente, :class_name => 'User'
  belongs_to :libromittente, :class_name => 'ProposedBook'
  belongs_to :destinatario, :class_name => 'User'
  belongs_to :librodestinatario, :class_name => 'ProposedBook'
end
