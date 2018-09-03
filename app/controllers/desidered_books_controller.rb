class DesideredBooksController < ApplicationController
  before_action :set_desidered_book, only: [:show, :edit, :update, :destroy]

  # GET /desidered_books
  # GET /desidered_books.json
  def index
    @desidered_books = current_user.DesideredBook
  end

  # GET /desidered_books/1
  # GET /desidered_books/1.json
  def show
  end

  # GET /desidered_books/new
  def new
    @desidered_book = DesideredBook.new
  end

  # GET /desidered_books/1/edit
  def edit
  end

  # POST /desidered_books
  # POST /desidered_books.json
  def create
    if params[:commit] == 'Crea'
      @desidered_book = ProposedBook.new(desidered_book_params)

      respond_to do |format|
        if @desidered_book.save
          format.html { redirect_to @desidered_book, notice: 'Desidered book was successfully created.' }
          format.json { render :show, status: :created, location: @desidered_book }
        else
          format.html { render :new }
          format.json { render json: @desidered_book.errors, status: :unprocessable_entity }
        end
      end
    else
      require 'open-uri'
      @data = JSON.parse(URI.parse('https://www.googleapis.com/books/v1/volumes?q=isbn:' + desidered_book_params[:ISBN]).read)
      if @data['totalItems'] > 0
        @b = @data['items'][0]['volumeInfo']
        p = { 'nome' => @b['title'],
              'autore' => @b['authors'][0],
              'genere' => desidered_book_params[:genere],
              'anno' => @b['publishedDate'],
              'ISBN' => desidered_book_params[:ISBN],
              'user_id' => desidered_book_params[:user_id]}
        @desidered_book = DesideredBook.new(p)
        respond_to do |format|
          if @desidered_book.save
            format.html { redirect_to @desidered_book, notice: 'Proposed book was successfully created.' }
            format.json { render :show, status: :created, location: @desidered_book }
          else
            format.html { render :new }
            format.json { render json: @desidered_book.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to root_path
      end
    end
  end

  # PATCH/PUT /desidered_books/1
  # PATCH/PUT /desidered_books/1.json
  def update
    respond_to do |format|
      if @desidered_book.update(desidered_book_params)
        format.html { redirect_to @desidered_book, notice: 'Desidered book was successfully updated.' }
        format.json { render :show, status: :ok, location: @desidered_book }
      else
        format.html { render :edit }
        format.json { render json: @desidered_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desidered_books/1
  # DELETE /desidered_books/1.json
  def destroy
    @desidered_book.destroy
    respond_to do |format|
      format.html { redirect_to desidered_books_url, notice: 'Desidered book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desidered_book
      @desidered_book = DesideredBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desidered_book_params
      params.require(:desidered_book).permit(:nome, :autore, :genere, :anno, :ISBN, :user_id)
    end
end
