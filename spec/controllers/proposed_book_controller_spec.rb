require 'rails_helper'

RSpec.describe ProposedBooksController, type: :controller do

	describe "GET #index " do
	    context "when logged in"  do
	      	login_user
	      	it "renders the index template" do
	        	get :index
	        	expect(response).to render_template("index")
	     	 end
	    end
	    context "when not logged in" do
	      	describe "GET #index without a logged account" do
	        	it "redirects to sign_in page" do
	          		get :index
	          		assert_redirected_to user_session_url
	        	end
	    	end
	    end
	end
end