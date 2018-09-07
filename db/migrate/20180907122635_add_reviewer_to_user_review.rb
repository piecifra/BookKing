class AddReviewerToUserReview < ActiveRecord::Migration[5.1]
  def change
    add_column :user_reviews, :reviewer, :string
  end
end
