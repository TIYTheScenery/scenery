class ReviewsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :delete]

  def create
    @review = Review.new(review_params)
    @success = @review.save
  end

  def show
    @review = Review.where(id: params[:id]).first
  end

  def index
    @reviews = Review.all
  end

  def update
    @review = Review.find_by(id: review_params[:id])
    @success = @review.update(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    @success = @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:id, :opinion, :rating, :user_id, :reviewee_id, :reviewee_type, :display_name)
  end
end
