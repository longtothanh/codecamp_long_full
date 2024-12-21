class ReviewsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "reviews_#{params[:book_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
