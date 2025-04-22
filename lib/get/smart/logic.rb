class Get::Smart::Logic
  def initialize
    validate_level

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
    Get::Smart::Tip.call(@random_file)
    Get::Smart.memory.write(@random_file)
  end

  def show?
    last_shown_datetime = Get::Smart.memory.last_shown_datetime

    Get::Smart.log("Level: #{Get::Smart.logic.current_level}")
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

  def filter_by_level(files)
    if current_level == [:any]
      files
    else
      files.select { |file| file =~ current_level_regexp }
    end
  end

  def current_level
    Array.wrap(Get::Smart.level).map { |level| level.to_sym }
  end

  def current_level_regexp
    # to match /beginner/ or /beginner|middle/
    Regexp.new("/" + current_level.join("|") + "(/|$)")
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

  private

  def validate_level
    unless current_level.all? { |level| level.in?(%i[any beginner middle advanced expert]) }
      raise "Invalid level: #{Get::Smart.level}. Valid levels are: any, beginner, middle, advanced, expert"
    end
  end
end
