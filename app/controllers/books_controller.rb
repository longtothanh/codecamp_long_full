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
end
