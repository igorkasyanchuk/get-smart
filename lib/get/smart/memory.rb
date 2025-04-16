class Get::Smart::Memory
  MEMORY_FILE = File.expand_path("~/.get-smart-memory")

  attr_reader :shown_files

  def initialize
    init
  end

  def write(file_path)
    memory_file.write("#{file_path}\n")
    @shown_files << file_path
  end

  def close
    memory_file.close
  end

  def reset
    Get::Smart.log("Resetting memory")
    memory_file.truncate(0)
    memory_file.rewind
    init
  end

  def last_shown_datetime
    return unless exists?

    memory_file.mtime
  end

  private

  def memory_file
    File.open(File.expand_path(MEMORY_FILE), "a+")
  end

  def exists?
    File.exist?(File.expand_path(MEMORY_FILE))
  end

  def init
    @shown_files = memory_file.readlines.compact_blank.map(&:strip)
  end
end
