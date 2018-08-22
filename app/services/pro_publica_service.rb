class ProPublicaService

  def initialize(state)
    @state = state
  end

  def representatives_by_state
    call[:results]
  end

  def copyright
    call[:copyright]
  end
    
  private

  def conn
    Faraday.new(:url => "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["pro_publica_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def call
    @rep_search ||= get_json("/congress/v1/members/house/#{@state}/current.json")
  end
end