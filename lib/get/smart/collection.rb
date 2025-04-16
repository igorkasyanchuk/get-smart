class Get::Smart::Collection
  def files
    @files ||= Get::Smart.paths.flat_map do |path|
      Dir.glob(File.join(path, "**", "*.md")).map { |file| file.strip }
    end
  end
end
