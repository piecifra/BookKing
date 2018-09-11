require 'rails_helper'


RSpec.describe Proposal, :type => :model do

  describe "Create valid review" do
	  it "should be permitted" do
	  	u = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	r = UserReview.create(:rating => 5, :comment => 'Ciao', :user => u)
	    expect(r).to be_valid
	  end
  end

  describe "Create valid review" do
	  it "should be permitted" do
	  	u = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	r = UserReview.create(:rating => 1, :comment => 'Questa è una recensione', :user => u)
	    expect(r).to be_valid
	  end
  end

  describe "Create invalid review" do
	  it "shouldn't be permitted" do
	  	u = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	r = UserReview.create(:comment => 'Questa è una recensione', :user => u)
	    expect(r).not_to be_valid
	  end
  end

  describe "Create invalid review" do
	  it "shouldn't be permitted" do
	  	u = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	r = UserReview.create(:rating => 1, :user => u)
	    expect(r).not_to be_valid
	  end
  end

  describe "Create invalid review" do
	  it "shouldn't be permitted" do
	  	u = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	r = UserReview.create(:rating => 1)
	    expect(r).not_to be_valid
	  end
  end

  describe "Create invalid review" do
	  it "shouldn't be permitted" do
	  	u = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	r = UserReview.create(:rating => 'ciao', :comment => 'Questa è una recensione', :user => u)
	    expect(r).not_to be_valid
	  end
  end

  describe "Create invalid review" do
	  it "shouldn't be permitted" do
	  	u = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	r = UserReview.create(:rating => 10, :comment => 'Questa è una recensione', :user => u)
	    expect(r).not_to be_valid
	  end
  end

end