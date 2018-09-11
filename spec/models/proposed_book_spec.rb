require 'rails_helper'

RSpec.describe ProposedBook, :type => :model do
  describe "Create book without an ISBN" do
	  it "shouldn't be permitted" do
	    book = ProposedBook.new(:nome => 'Titolo', :anno => 2010, :genere => 'Genere', :autore => 'autore')
	    expect(book).not_to be_valid
	  end
  end

  describe "Create book without a title" do
	  it "shouldn't be permitted" do
	    book = ProposedBook.new(:anno => 2010, :genere => 'Genere', :autore => 'autore', :ISBN => '123456')
	    expect(book).not_to be_valid
	  end
  end

  describe "Create book with an invalid ISBN" do
	  it "shouldn't be permitted" do
	    book = ProposedBook.new(:nome => 'Titolo', :anno => 2010, :genere => 'Genere', :autore => 'autore', :ISBN => 'ciao')
	    expect(book).not_to be_valid
	  end
  end

  describe "Create book with long ISBN" do
	  it "shouldn't be permitted" do
	    book = ProposedBook.new(:nome => 'Titolo', :anno => 2010, :genere => 'Genere', :autore => 'autore', :ISBN => '12345678901234567890')
	    expect(book).not_to be_valid
	  end
  end


end