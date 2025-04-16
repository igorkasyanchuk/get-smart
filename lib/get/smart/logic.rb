class Get::Smart::Logic
  def initialize
    Get::Smart.collection = Get::Smart::Collection.new
  end

  def call
    return unless show?

    @random_file = random_file

    if @random_file.nil? && Get::Smart.collection.files.any?
      Get::Smart.memory.reset
      @random_file = random_file
    end

    Get::Smart.log("Getting random file: #{@random_file}")
    Get::Smart::Tip.new.call(@random_file)
    Get::Smart.memory.write(@random_file)
  end

  def show?
    last_shown_datetime = Get::Smart.memory.last_shown_datetime

    Get::Smart.log("Last shown datetime: #{last_shown_datetime}")
    Get::Smart.log("Frequency: #{Get::Smart.frequency}")
    Get::Smart.log("Frequency datetime: #{frequency_datetime}")

    result = last_shown_datetime.nil? || last_shown_datetime < frequency_datetime

    Get::Smart.log("Show? -> #{result}")

    result
  end

  def frequency_datetime
    Get::Smart::FREQUENCIES[Get::Smart.frequency].call.ago
  end

  private

  def random_file
    all_files = Get::Smart.collection.files
    shown_files = Get::Smart.memory.shown_files

    Get::Smart.log("All files: #{all_files.size}")
    Get::Smart.log("Shown files: #{shown_files.size}")

    available_files = (all_files - shown_files)
    Get::Smart.log("Available files: #{available_files.size}")
    available_files.sample
  end
end
