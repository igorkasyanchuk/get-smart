class Get::Smart::Tip
  def call(path)
    return if path.nil?

    puts TTY::Markdown.parse(File.read(path), indent: 0)
  end
end
