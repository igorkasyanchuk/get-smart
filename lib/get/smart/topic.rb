class Get::Smart::Topic
  attr_reader :name, :path

  def initialize(name, path)
    @name = name
    @path = path
  end

  def files
    @files ||= Dir.glob("#{@path}#{name}/**/*.md")
  end
end
