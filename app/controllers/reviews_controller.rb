class ReviewsController < ApplicationController
    def create
        @book = Book.find(params[:book_id])
        @review = Review.new(book_id: params[:book_id], content: params[:content])
        @review.save
        binding.pry
        redirect_to book_path(@book), notice: "Review #{@book.title} created successfully!"
    end

    def new
        @review = Review.new
    end

    def index
        @book = Book.find(params[:book_id])
        @reviews = @book.reviews.order(created_at: :desc)
    end
end
