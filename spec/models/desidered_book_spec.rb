require 'rails_helper'

RSpec.describe DesideredBook, :type => :model do
  describe "Create book without an ISBN" do
	  it "shouldn't be permitted" do
	  	m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    book = DesideredBook.new(:user => m1, :nome => 'Titolo', :anno => 2010, :genere => 'Genere', :autore => 'autore')
	    expect(book).not_to be_valid
	  end
  end

  describe "Create book without user" do
	  it "shouldn't be permitted" do
	    book = DesideredBook.new(:anno => 2010, :genere => 'Genere', :autore => 'autore', :ISBN => '123456')
	    expect(book).not_to be_valid
	  end
  end


  describe "Create book without a title" do
	  it "shouldn't be permitted" do
	  	m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    book = DesideredBook.new(:user => m1, :anno => 2010, :genere => 'Genere', :autore => 'autore', :ISBN => '123456')
	    expect(book).not_to be_valid
	  end
  end

  describe "Create book without invalid ISBN" do
	  it "shouldn't be permitted" do
	  	m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    book = DesideredBook.new(:user => m1, :anno => 2010, :genere => 'Genere', :autore => 'autore', :ISBN => 'ciao')
	    expect(book).not_to be_valid
	  end
  end

  describe "Create book with long ISBN" do
	  it "shouldn't be permitted" do
	  	m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    book = DesideredBook.new(:user => m1, :nome => 'Titolo', :anno => 2010, :genere => 'Genere', :autore => 'autore', :ISBN => '12345678901234567890')
	    expect(book).not_to be_valid
	  end
  end

  describe "Create valid book" do
	  it "should be permitted" do
	  	m1 = User.new(:id => '1', :email => 'prova1@example.it', :username => 'user1', :password => 'useruser')
	    book = DesideredBook.new(:user => m1, :nome => 'Titolo', :anno => 2010, :genere => 'Genere', :autore => 'autore', :ISBN => '1234567890')
	    expect(book).to be_valid
	  end
  end

  describe "Create valid book" do
	  it "should be permitted" do
	  	m1 = User.new(:id => '2', :email => 'prova2@example.it', :username => 'user2', :password => 'useruser')
	    book = DesideredBook.new(:user => m1, :nome => 'Titolo', :anno => 2010, :genere => 'Genere', :autore => 'autore', :ISBN => '1234567890')
	    expect(book).to be_valid
	  end
  end


end