class UserReview < ApplicationRecord
  belongs_to :user

  validates :user_id, :comment, :rating, presence: true
  validates :rating, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  validate :is_valid_rating


  private

  def is_valid_rating
  	if rating != 1 && rating != 2 && rating != 3 && rating != 4 && rating != 5
  		errors.add(:domain, "Valore non ammesso")
  	end
  end
end
