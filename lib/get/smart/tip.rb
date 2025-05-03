class Get::Smart::Tip
  def self.print_tip(path)
    return if path.nil?

    level = path.split("/")[-2].to_s
    file_name = File.basename(path)
    folder = path.split("/")[-4..-3].join("/")

    # print width of the box
    width = TTY::Screen.width - 4

    if Get::Smart.print_file_details
      print "┌".yellow
      print "─────[#{folder}##{file_name}] / [#{level}]".ljust(width, "─").yellow
      print "┐".yellow
      puts
    end

    print TTY::Markdown.parse(File.read(path), indent: 2) + "\r"

    if Get::Smart.print_file_details
      print "└".yellow
      print "─".ljust(width, "─").yellow
      print "┘".yellow
      puts
    end
  end

  # TODO: this is under development, sometimes works, sometimes not
  def self.print_tip_in_frame(path)
    return if path.nil?

    level = path.split("/")[-2].to_s
    file_name = File.basename(path)

    frame = TTY::Box.frame(
      width: 160,
      padding: [ 2, 2, 2, 2 ],
      title: {
        top_left: file_name.red,
        bottom_right: level.green
      }
    ) do
      TTY::Markdown.parse(File.read(path), indent: 0, width: 90)
    end

    puts frame
  end
end
