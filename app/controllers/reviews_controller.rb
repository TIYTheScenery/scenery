class ReviewsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :delete]

  def create
    if @review = Review.new(review_params)
      @success = @review.save
    else
      @success = false
    end
  end

  def show
    @review = Review.where(id: params[:id]).first
  end

  def index
  end

  def update
    if @review = Review.find_by(id: review_params[:id])
      @success = @review.update(review_params)
    else
      @success = false
    end
  end

  def delete
    if @review = Review.find(params[:id])
      @success = @review.destroy
    else
      @success = false
    end
  end

  private
  def review_params
    params.require(:review).permit(:id, :opinion, :rating, :user_id, :reviewee_id, :reviewee_type)
  end
end
