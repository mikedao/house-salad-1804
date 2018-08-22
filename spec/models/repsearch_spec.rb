require "rails_helper"

describe RepSearch do 
  it "exists" do
    repsearch = RepSearch.new("CO")

    expect(repsearch).to be_a(RepSearch)
  end
  
  context "instance methods" do
    context "#representatives" do
      it "returns representatives for a valid state" do
        repsearch = RepSearch.new("CO")

        expect(repsearch.representatives.count).to eq(7)
        expect(repsearch.representatives.first).to be_a(Representative)
      end

    end
  end
end