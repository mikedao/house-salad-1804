class SearchController < ApplicationController
  def index
    @repsearch = RepSearch.new(params[:state])
  end
end
