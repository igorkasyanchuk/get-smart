require_relative "spec_helper"

describe "Happy Path" do
  it "should be happy" do
    Get::Smart.enabled = true
    Get::Smart.debug = true

    expect { Get::Smart.logic.call }.not_to raise_error
  end
end
