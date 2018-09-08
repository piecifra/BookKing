class UserReviewsController < ApplicationController

	def create
		@review = UserReview.new(user_review_params)
		@review.save
		redirect_to root_path
	end

	def ordina
	end

	def index
		@reviews = UserReview.all
	end

	def show
		puts 'aaaaaa'
		@reviews = UserReview.all
	end

	def new
		@review = UserReview.new
	end

	private

	# Never trust parameters from the scary internet, only allow the white list through.
	def user_review_params
		params.require(:user_review).permit(:user_id, :comment, :rating, :reviewer)
	end
end
