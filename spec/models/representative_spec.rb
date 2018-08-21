require "rails_helper"

describe Representative do
  it "exists" do
    attributes = {}
    representative = Representative.new(attributes)

    expect(representative).to be_a(Representative)
  end

  it "has attributes" do
    attributes = {  name: "Alice",
                    party: "D",
                    role: "Representative",
                    district: "1"
    }

    representative = Representative.new(attributes)

    expect(representative.name).to eq("Alice")
    expect(representative.party).to eq("D")
    expect(representative.role).to eq("Representative")
    expect(representative.district).to eq("1")
  end

end