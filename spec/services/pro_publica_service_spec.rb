require "rails_helper"

describe ProPublicaService do 
  it "exists" do
    service = ProPublicaService.new("CO")
    expect(service).to be_a(ProPublicaService)
  end

  context "instance methods" do
    context "#representatives_by_state" do
      it "can get representatives by state" do
        service = ProPublicaService.new("CO")
        result = service.representatives_by_state

        expect(result).to be_a(Array)
        expect(result.first).to have_key(:name)
        expect(result.first).to have_key(:role)
        expect(result.first).to have_key(:party)
        expect(result.first).to have_key(:district)
      end
    end
  end
end