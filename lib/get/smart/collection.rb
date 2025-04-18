class Get::Smart::Collection
  def files
    @files ||= Get::Smart.paths.flat_map do |path|
      Dir.glob(File.join(path, "**", "*.md")).map { |file| file.strip }
    end
  end

  def root_topics
    @root_topics ||= begin
      Get::Smart.paths.flat_map do |path|
        Get::Smart.log("path: #{path}")
        res = Dir.glob(File.join(path, "**", "**", "**")).select { |file| File.directory?(file) }
        res.map { |file| file.gsub(path, "") }.reject { |file| file.empty? }
      end
    end
  end
end
