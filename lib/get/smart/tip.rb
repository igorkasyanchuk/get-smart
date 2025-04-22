class Get::Smart::Tip
  def self.call(path)
    return if path.nil?

    level = path.split("/")[-2].to_sym

    if Get::Smart.print_file_details
      puts "====[#{File.basename(path)}] / [#{level}]".ljust(120, "=").yellow
      puts
    end

    puts TTY::Markdown.parse(File.read(path), indent: 0)
  end
end
