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

    expect(files.size).to eq(630)
    expect(files.map(&:to_s).join("\n")).not_to include("/advanced/")
    expect(files.map(&:to_s).join("\n")).not_to include("/expert/")
    expect(files.map(&:to_s).join("\n")).not_to include("/middle/")
    expect(files.map(&:to_s).join("\n")).not_to include("/mysql/")
    expect(files.map(&:to_s).join("\n")).not_to include("/postgresql/")

    expect(files.map(&:to_s).join("\n")).to include("/gems/devise/")
    expect(files.map(&:to_s).join("\n")).to include("/nosql/redis/")
    expect(files.map(&:to_s).join("\n")).to include("/sql/general/")
  end

  it "can print tree" do
    Get::Smart.logic = Get::Smart::Logic.new

    expect { Get::Smart::Topics.print_tree }.not_to raise_error
  end

  it "can call memory" do
    Get::Smart.logic = Get::Smart::Logic.new

    expect { Get::Smart.logic.memory.reset }.not_to raise_error
  end

  it "can call app context" do
    Get::Smart.logic = Get::Smart::Logic.new

    context = Get::Smart::AppContext.new.call

    expect(context).to be_a(Hash)
    expect(context[:gems]).to be_a(Array)
    expect(context[:databases]).to be_a(Array)
    expect(context[:gems]).to include("sqlite3")
    expect(context[:databases]).to include("sqlite")
  end

  it "can get the contextual files" do
    result = Get::Smart::LearningPath.new.call

    expect(result).to include("/files/sql/general/")
    expect(result).to include("/files/sql/sqlite/")
    expect(result).to include("/files/gems/error_highlight/")
    expect(result).to include("/files/gems/redis/")
    expect(result).to include("/files/nosql/redis/")
    expect(result).to include("/files/rails/")
    expect(result).to include("/files/ruby/")
    expect(result).to include("/files/javascript/")
  end
end
