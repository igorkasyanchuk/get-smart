if defined?(Get::Smart)
  Get::Smart.setup do |config|
    # Enable or disable Get::Smart. Default: Rails.env.development?
    config.enabled = Rails.env.development?

    # Specify level, by default it's [:any], you can specify multiple levels
    # Available options: [:any, :beginner, :middle, :advanced, :expert]
    # Example:
    #   config.level = [:beginner, :advanced]
    #   config.level = [:advanced, :expert]
    #   config.level = :any
    config.level = :any

    # Frequency for showing tips. Default: :always
    # Available options:
    #   :always, :half_hourly, :hourly, :every_two_hours, :every_three_hours,
    #   :every_four_hours, :every_five_hours, :every_six_hours, :every_seven_hours,
    #   :every_eight_hours, :every_nine_hours, :every_ten_hours, :every_eleven_hours,
    #   :every_twelve_hours, :daily, :every_two_days, :weekly,
    config.frequency = :always

    # Path to the file that will store the last shown tip. Default: ~/.get-smart-memory
    # config.memory_file_path = File.expand_path("~/.get-smart-memory")
    #

    # Print file details with the tip. Default: false
    config.print_file_details = true
  end
end
