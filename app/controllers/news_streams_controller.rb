class NewsStreamsController < ApplicationController
  def index
    @reviews = Review.last(9).reverse
    @opportunities = Opportunity.last(9).reverse
    @performances = Performance.last(9).reverse
    @lessons = Lesson.last(9).reverse
  end
end
