class SearchController < ApplicationController
  def index
    # https://api.propublica.org/congress/v1/members/house/CO/current.json

    conn = Faraday.new(:url => "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = "S9JON3ruNOI6XiyymcnZ7gtsjnToPxuXyT0bgeaX"
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/congress/v1/members/house/CO/current.json")

    @representatives = JSON.parse(response.body, symbolize_names: true)[:results]    
    binding.pry
  end
end
