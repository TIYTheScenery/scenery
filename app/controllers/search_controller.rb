class SearchController < ApplicationController
  def index
    @performances = []
    @professionals = []
    @companies = []
    if params[:type] == "1" then
      @performances = Search.performances(params)
    elsif params[:type] == "2" then
      @professionals = Search.professionals(params)
    elsif params[:type] == "3" then
      @companies = Search.companies(params)
    end
  end
end
