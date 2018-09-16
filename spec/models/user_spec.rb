require 'rails_helper'


RSpec.describe User, :type => :model do

  describe "Create valid user" do
	  it "should be permitted" do
	  	u = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    expect(u).to be_valid
	  end
  end

  describe "Create valid user" do
	  it "should be permitted" do
	  	u1 = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	u2 = User.create(:email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	  	u3 = User.create(:email => 'prova3@example.it', :username => 'user3', :password => 'useruser')
	    expect(u1).to be_valid
	    expect(u2).to be_valid
	    expect(u3).to be_valid
	  end
  end

  describe "Create valid user" do
	  it "should be permitted" do
	  	u1 = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	u2 = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    expect(u1).to be_valid
	  end
  end

  describe "Create valid user" do
	  it "should be permitted" do
	  	u = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    expect(u).to be_valid
	  end
  end

  describe "Create invalid user" do
	  it "shouldn't be permitted" do
	  	u1 = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	u2 = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    expect(u2).not_to be_valid
	  end
  end

  describe "Create invalid user" do
	  it "shouldn't be permitted" do
	  	u1 = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	u2 = User.create(:email => 'prova1@example.it', :username => 'user2', :password => 'useruser')
	    expect(u2).not_to be_valid
	  end
  end

  describe "Create invalid user" do
	  it "shouldn't be permitted" do
	  	u1 = User.create(:email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  	u2 = User.create(:email => 'prova2@example.it', :username => 'user1', :password => 'useruser')
	    expect(u2).not_to be_valid
	  end
  end

  describe "Create invalid user" do
	  it "shouldn't be permitted" do
	  	u = User.create(:username => 'user1', :password => 'useruser')
	    expect(u).not_to be_valid
	  end
  end

  describe "Create invalid user" do
	  it "shouldn't be permitted" do
	  	u = User.create(:email => 'prova@example.it', :password => 'useruser')
	    expect(u).not_to be_valid
	  end
  end

  describe "Create invalid user" do
	  it "shouldn't be permitted" do
	  	u = User.create(:email => 'prova@example.it', :username => 'user')
	    expect(u).not_to be_valid
	  end
  end


end