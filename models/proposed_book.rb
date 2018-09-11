class ProposedBook < ApplicationRecord
  belongs_to :user
  validates :nome, :ISBN, presence: true
  validates :ISBN, length: { maximum: 13 }
  validates :ISBN, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
end
