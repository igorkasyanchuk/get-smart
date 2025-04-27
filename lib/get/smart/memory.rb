class Get::Smart::Memory
  attr_reader :shown_files

  def initialize
    @shown_files = memory_file.readlines.compact_blank.map(&:strip)
  end

  def write(file_path)
    memory_file.write("#{file_path}\n")
  end

  def close
    memory_file.close
  end

  def reset
    Get::Smart.log("Resetting memory")
    memory_file.truncate(0)
    memory_file.rewind
    @shown_files = []
  end

  def last_shown_datetime
    return unless exists?

    memory_file.mtime
  end

  private

  def memory_file
    File.open(File.expand_path(Get::Smart.memory_file_path), "a+")
  end

  def exists?
    File.exist?(File.expand_path(Get::Smart.memory_file_path))
  end
end
