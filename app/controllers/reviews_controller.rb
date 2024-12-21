class ReviewsController < ApplicationController
    def create
        @book = Book.find(params[:book_id])        
    end
end
