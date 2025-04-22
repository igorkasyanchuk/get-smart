class Get::Smart::Collection
  def files
    @files ||= Get::Smart.paths.flat_map do |path|
      Dir.glob(File.join(path, "**", "*.md")).map { |file| file.strip }
    end
  end

  def topics
    @topics ||= begin
      Get::Smart.paths.map do |path|
        Get::Smart.log("path: #{path}")
        res = Dir.glob(File.join(path, "**", "**", "**")).select { |file| File.directory?(file) }
        files = res.map { |file| file.gsub(path, "") }.reject { |file| file.empty? }

        files = Get::Smart.logic.filter_by_level(files)

        {
          path: path,
          topics: files
        }
      end
    end
  end

  def print_tree
    tree = {}
    Get::Smart.collection.topics.each do |info|
      info[:topics].each do |topic|
        tree[topic] ||= 0
        tree[topic] += Dir.glob(File.join(info[:path], topic, "**", "**", "**")).select { |file| File.file?(file) }.size
      end
    end

    tree.to_h.each do |topic, count|
      level = topic.count("/") - 1
      print "   " * level
      puts "#{topic.to_s.yellow} #{count.to_s.green}"
    end
  end
end
