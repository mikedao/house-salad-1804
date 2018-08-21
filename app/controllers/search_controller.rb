class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = "S9JON3ruNOI6XiyymcnZ7gtsjnToPxuXyT0bgeaX"
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/congress/v1/members/house/#{params[:state]}/current.json")

    @representatives = JSON.parse(response.body, symbolize_names: true)[:results]    
    
    @representatives = @representatives.map do |rep_data|
      Representative.new(rep_data)
    end
  end
end
