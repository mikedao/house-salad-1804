class RepSearch
  def initialize(state)
    @service = ProPublicaService.new(state)
  end

  def representatives
    @service.representatives_by_state.map do |rep_data|
      Representative.new(rep_data)
    end
  end

  def copyright
    @service.copyright
  end

  def date
    "Mike says Hi"
  end
end