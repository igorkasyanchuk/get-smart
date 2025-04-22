require_relative "spec_helper"

describe "Happy Path" do
  it "should be happy" do
    Get::Smart.enabled = true
    Get::Smart.debug = true

    expect { Get::Smart.logic.call }.not_to raise_error
  end

  it "get correct topisc" do
    topics = Get::Smart::Collection.new.topics.map { |info| info[:topics] }.flatten

    expect(topics).to include("/rails/active_storage")
    expect(topics).to include("/gems/devise/beginner")
    expect(topics).to include("/gems")
  end
end
