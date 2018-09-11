require 'rails_helper'

RSpec.describe Proposal, :type => :model do

	describe "Create valid Proposal" do
	  	it "should be permitted" do
	  		m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		m2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	  		b1 = ProposedBook.new(:nome => 'libro1', :ISBN => '1234567890', :user_id => '1')
	  		b2 = ProposedBook.new(:nome => 'libro2', :ISBN => '1234567890', :user_id => '2')
	    	p = Proposal.create(:id => '1', :destinatario => m1, :libromittente => b1, :librodestinatario => b2, :mittente => m2)
	    	expect(p).to be_valid
	 	 end
	end

	describe "Create invalid Proposal" do
	  	it "shouldn't be permitted" do
	  		m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		b1 = ProposedBook.new(:nome => 'libro1', :ISBN => '1234567890', :user_id => '1')
	  		b2 = ProposedBook.new(:nome => 'libro2', :ISBN => '1234567890', :user_id => '1')
	    	p = Proposal.create(:id => '1', :destinatario => m1, :libromittente => b1, :librodestinatario => b2, :mittente => m1)
	    	expect(p).not_to be_valid
	 	 end
	end

	describe "Create invalid Proposal" do
	  	it "shouldn't be permitted" do
	  		m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		b1 = ProposedBook.new(:nome => 'libro1', :ISBN => '1234567890', :user_id => '1')
	    	p = Proposal.create(:id => '1', :destinatario => m1, :libromittente => b1, :librodestinatario => b1, :mittente => m1)
	    	expect(p).not_to be_valid
	 	 end
	end

	describe "Create invalid Proposal" do
	  	it "shouldn't be permitted" do
	  		m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		m2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	  		b1 = ProposedBook.new(:nome => 'libro1', :ISBN => '1234567890', :user_id => '1')
	    	p = Proposal.create(:id => '1', :destinatario => m1, :libromittente => b1, :librodestinatario => b1, :mittente => m2)
	    	expect(p).not_to be_valid
	 	 end
	end

	describe "Create invalid Proposal" do
	  	it "shouldn't be permitted" do	  		
	  		m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		m2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	  		b1 = ProposedBook.new(:nome => 'libro1', :ISBN => '1234567890', :user_id => '1')
	  		b2 = ProposedBook.new(:nome => 'libro2', :ISBN => '1234567890', :user_id => '2')
	  		p = Proposal.create(:id => '1', :libromittente => b1, :librodestinatario => b2, :mittente => m2)
	    	expect(p).not_to be_valid
	 	 end
	end

	describe "Create invalid Proposal" do
	  	it "shouldn't be permitted" do
	  		m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		m2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	  		b1 = ProposedBook.new(:nome => 'libro1', :ISBN => '1234567890', :user_id => '1')
	  		b2 = ProposedBook.new(:nome => 'libro2', :ISBN => '1234567890', :user_id => '2')
	    	p = Proposal.create(:id => '1', :destinatario => m1, :librodestinatario => b2, :mittente => m2)
	    	expect(p).not_to be_valid
	 	 end
	end

	describe "Create invalid Proposal" do
	  	it "shouldn't be permitted" do
	  		m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		m2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	  		b1 = ProposedBook.new(:nome => 'libro1', :ISBN => '1234567890', :user_id => '1')
	  		b2 = ProposedBook.new(:nome => 'libro2', :ISBN => '1234567890', :user_id => '2')
	    	p = Proposal.create(:id => '1', :destinatario => m1, :libromittente => b1, :mittente => m2)
	    	expect(p).not_to be_valid
	 	 end
	end

	describe "Create invalid Proposal" do
	  	it "shouldn't be permitted" do
	  		m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		m2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	  		b1 = ProposedBook.new(:nome => 'libro1', :ISBN => '1234567890', :user_id => '1')
	  		b2 = ProposedBook.new(:nome => 'libro2', :ISBN => '1234567890', :user_id => '2')
	    	p = Proposal.create(:id => '1', :destinatario => m1, :libromittente => b1, :librodestinatario => b2)
	    	expect(p).not_to be_valid
	 	 end
	end
end