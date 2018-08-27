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
    @desidered_book = DesideredBook.new(desidered_book_params)

    respond_to do |format|
      if @desidered_book.save
        format.html { redirect_to @desidered_book, notice: 'Desidered book was successfully created.' }
        format.json { render :show, status: :created, location: @desidered_book }
      else
        format.html { render :new }
        format.json { render json: @desidered_book.errors, status: :unprocessable_entity }
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
