class Representative
  attr_reader :name, :party, :role, :district
  def initialize(data)
    @name       = data[:name]
    @party      = data[:party]
    @role       = data[:role]
    @district   = data[:district]
  end
end