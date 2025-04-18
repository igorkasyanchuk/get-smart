require "get/smart/version"
require "get/smart/railtie"
require "get/smart/collection"
require "get/smart/tip"
require "get/smart/memory"
require "get/smart/logic"
require "get/smart/topics"
require "tty-markdown"

module Get
  module Smart
    mattr_accessor :debug
    self.debug = false

    mattr_accessor :frequency
    self.frequency = :always

    FREQUENCIES = {
      always: -> { 0.seconds },
      half_hourly: -> { 30.minutes },
      hourly: -> { 1.hour },
      every_two_hours: -> { 2.hours },
      every_three_hours: -> { 3.hours },
      every_four_hours: -> { 4.hours },
      every_five_hours: -> { 5.hours },
      every_six_hours: -> { 6.hours },
      every_seven_hours: -> { 7.hours },
      every_eight_hours: -> { 8.hours },
      every_nine_hours: -> { 9.hours },
      every_ten_hours: -> { 10.hours },
      every_eleven_hours: -> { 11.hours },
      every_twelve_hours: -> { 12.hours },
      daily: -> { 1.day },
      every_two_days: -> { 2.days },
      weekly: -> { 1.week }
    }

    mattr_accessor :enabled
    self.enabled = Rails.env.development?

    mattr_accessor :paths
    self.paths = [
      File.join(File.dirname(__FILE__), "..", "..", "files")
    ]

    mattr_accessor :collection
    self.collection = []

    mattr_accessor :memory_file_path
    self.memory_file_path = File.expand_path("~/.get-smart-memory")

    mattr_accessor :memory
    self.memory = Get::Smart::Memory.new

    mattr_accessor :logic
    self.logic = Get::Smart::Logic.new

    class << self
      def log(message)
        called_method = caller_locations(1, 1).first.label
        puts "#{called_method} -> #{message}" if debug
      end

      # Yield configuration to block for initializer
      def setup
        yield self if block_given?
      end
    end
  end
end
