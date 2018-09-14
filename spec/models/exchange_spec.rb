require 'rails_helper'

RSpec.describe Exchange, :type => :model do

	describe "Create valid Exchange" do
	  	it "should be permitted" do
	  		u1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		u2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	    	e = Exchange.create(:destinatario => u1, :libromittente => 'Libro1', :librodestinatario => 'Libro2', :mittente => u2)
	    	expect(e).to be_valid
	 	 end
	end

	describe "Create valid Exchange" do
	  	it "should be permitted" do
	  		u1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		u2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	    	e = Exchange.create(:destinatario => u1, :libromittente => 'Libro1', :librodestinatario => 'Libro1', :mittente => u2)
	    	expect(e).to be_valid
	 	 end
	end

	describe "Create invalid Exchange" do
	  	it "shouldn't be permitted" do
	  		u1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    	e = Exchange.create(:destinatario => u1, :libromittente => 'Libro1', :librodestinatario => 'Libro2')
	    	expect(e).not_to be_valid
	 	 end
	end

	describe "Create invalid Exchange" do
	  	it "shouldn't be permitted" do
	  		u1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    	e = Exchange.create(:mittente => u1, :libromittente => 'Libro1', :librodestinatario => 'Libro2')
	    	expect(e).not_to be_valid
	 	 end
	end


	describe "Create invalid Exchange" do
	  	it "shouldn't be permitted" do
	  		u1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		u2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	    	e = Exchange.create(:destinatario => u1, :librodestinatario => 'Libro1', :mittente => u2)
	    	expect(e).not_to be_valid
	 	 end
	end

	describe "Create invalid Exchange" do
	  	it "shouldn't be permitted" do
	  		u1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	  		u2 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	    	e = Exchange.create(:destinatario => u1, :libromittente => 'Libro1', :mittente => u2)
	    	expect(e).not_to be_valid
	 	 end
	end

end