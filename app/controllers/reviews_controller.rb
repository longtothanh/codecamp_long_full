class ReviewsController < ApplicationController
    def create
        @book = Book.find(params[:book_id])
        @review = Review.new(book_id: params[:book_id], content: params[:content])
        @review.save
        redirect_to book_path(@book), notice: "Review #{@book.title} created successfully!"  
    end
end
