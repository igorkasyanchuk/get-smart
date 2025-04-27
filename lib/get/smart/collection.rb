class Get::Smart::Collection
  def initialize(topics)
    @topics = topics
  end

  def files
    @files ||= @topics.flat_map(&:files)
  end

  def topics
    @topics ||= begin
      Get::Smart.paths.flat_map do |path|
        Get::Smart::Topic.new(path)
      end
    end
  end
end
