require_relative "spec_helper"

describe "Happy Path" do
  it "should be happy" do
    Get::Smart.enabled = true
    Get::Smart.debug = true

    Get::Smart.logic = Get::Smart::Logic.new

    expect { Get::Smart.logic.call }.not_to raise_error
  end

  it "get correct topics" do
    Get::Smart.logic = Get::Smart::Logic.new

    topics = Get::Smart.logic.collection.topics.map(&:name)

    expect(topics).to include("/rails/active_storage")
    expect(topics).to include("/gems/devise")
  end

  it "can find topics" do
    Get::Smart.logic = Get::Smart::Logic.new

    topics = Get::Smart::Topics.all

    expect(topics.map(&:name)).to include("/ruby/networking")
    expect(topics.map(&:name)).to include("/sql/mysql")
  end

  it "can get files inside a topic" do
    Get::Smart.logic = Get::Smart::Logic.new

    topic = Get::Smart::Topic.new("/ruby/networking", File.join(Get::Smart.root_path, "files"))

    expect(topic.files).to include(File.join(Get::Smart.root_path, "files", "ruby", "networking", "beginner", "tcp_server_example.md"))
  end

  it "can get filtered files" do
    Get::Smart.level = [ :beginner ]
    Get::Smart.logic = Get::Smart::Logic.new

    files = Get::Smart.logic.files

    expect(files.size).to eq(726)
    expect(files.map(&:to_s).join("\n")).not_to include("/advanced/")
    expect(files.map(&:to_s).join("\n")).not_to include("/expert/")
    expect(files.map(&:to_s).join("\n")).not_to include("/middle/")
  end
end
