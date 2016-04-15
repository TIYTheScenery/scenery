class LessonsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :delete]
  before_action :authenticate_professional, only: [:create, :edit, :update, :delete]

  def create
    @lesson = Lesson.new(lesson_params)
    @success =  @lesson.save
  end

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.where(id: params[:id]).first
  end

  def update
    @lesson = Lesson.find_by(id: lesson_params[:id])
    @success = @lesson.update(lesson_params)
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @success =  @lesson.destroy
  end
  private
  def lesson_params
    params.require(:lesson).permit(:id, :owner_id, :name, :description, :poster, :company_id, :number_of_seats, :ticket_link,
    show_times_attributes: [:id, :event_id, :begin_time, :venue_id, :address, :city, :state, :zip_code, :show_date, :_destroy],
    genre_lessons_attributes: [:id, :lesson_id, :genre_id],
    reviews_attributes: [:id, :opinion, :user_id, :rating, :reviewee_id, :reviewee_type, :_destroy])
  end
end
