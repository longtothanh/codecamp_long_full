class BooksController < ApplicationController
  def index
    if params[:search].present?
      @books = Book.where("title LIKE ?", "%#{params[:search]}%")
    else
      @books = Book.all
    end

    respond_to do |format|
      format.html # Cho tải lần đầu
      format.js   # Cho các yêu cầu AJAX
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "#{@book.title} deleted successfully!"
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path, notice: "#{@book.title} created successfully!"
  end

  private

  def book_params
    params.require(:book).permit(:title, :content)
  end
end
