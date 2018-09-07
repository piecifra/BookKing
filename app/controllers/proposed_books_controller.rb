class ProposedBooksController < ApplicationController
  before_action :set_proposed_book, only: [:show, :edit, :update, :destroy]

  # GET /proposed_books
  # GET /proposed_books.json
  def index
    @proposed_books = current_user.ProposedBook
  end

  def search
    @ricerca = params['ricerca']
    @value = params[:search]
    ascdesc = ' ASC'
    ord = 'nome'
    if params['Ordina'] != nil
      ord = params['Ordina']
      if params['AscDesc'] == 'decrescente'
        ascdesc = ' DESC'
      end
    end
    puts ord + ascdesc
    @proposed_books = ProposedBook.where([@ricerca + " LIKE ?","%#{@value}%"]).order(ord + ascdesc)

  end

  # GET /proposed_books/1
  # GET /proposed_books/1.json
  def show
    @user_books = current_user.ProposedBook
  end

  # GET /proposed_books/new
  def new
    @proposed_book = ProposedBook.new
  end

  # GET /proposed_books/1/edit
  def edit
  end

  # POST /proposed_books
  # POST /proposed_books.json
  def create

    if params[:commit] == 'Crea'
      @proposed_book = ProposedBook.new(proposed_book_params)

      respond_to do |format|
        if @proposed_book.save
          format.html { redirect_to @proposed_book, notice: 'Proposed book was successfully created.' }
          format.json { render :show, status: :created, location: @proposed_book }
        else
          format.html { render :new }
          format.json { render json: @proposed_book.errors, status: :unprocessable_entity }
        end
      end
    else
      require 'open-uri'
      @data = JSON.parse(URI.parse('https://www.googleapis.com/books/v1/volumes?q=isbn:' + proposed_book_params[:ISBN]).read)
      if @data['totalItems'] > 0
        @b = @data['items'][0]['volumeInfo']
        @g = ''
        if @b.key?('categories')
          @g = @b['categories'][0]
        else 
          @g = proposed_book_params[:genere]
        end
        p = { 'nome' => @b['title'],
              'autore' => @b['authors'][0],
              'genere' => @g,
              'anno' => @b['publishedDate'],
              'stato' => proposed_book_params[:stato],
              'ISBN' => proposed_book_params[:ISBN],
              'user_id' => proposed_book_params[:user_id]}
        @proposed_book = ProposedBook.new(p)
        respond_to do |format|
          if @proposed_book.save
            format.html { redirect_to @proposed_book, notice: 'Proposed book was successfully created.' }
            format.json { render :show, status: :created, location: @proposed_book }
          else
            format.html { render :new }
            format.json { render json: @proposed_book.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to root_path
      end
    end
  end

  # PATCH/PUT /proposed_books/1
  # PATCH/PUT /proposed_books/1.json
  def update
    respond_to do |format|
      if @proposed_book.update(proposed_book_params)
        format.html { redirect_to @proposed_book, notice: 'Proposed book was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposed_book }
      else
        format.html { render :edit }
        format.json { render json: @proposed_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposed_books/1
  # DELETE /proposed_books/1.json
  def destroy
    @proposed_book.destroy
    respond_to do |format|
      format.html { redirect_to proposed_books_url, notice: 'Proposed book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposed_book
      @proposed_book = ProposedBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposed_book_params
      params.require(:proposed_book).permit(:nome, :autore, :genere, :stato, :anno, :ISBN, :user_id)
    end
end
