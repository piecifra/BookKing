class ProposedBook < ApplicationRecord
  belongs_to :user
  validates :nome, :ISBN, presence: true

end
