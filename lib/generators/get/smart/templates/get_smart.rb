Get::Smart.setup do |config|
  # Enable or disable Get::Smart. Default: Rails.env.development?
  config.enabled = Rails.env.development?

  # Paths to scan for tip files. Default:
  # config.paths += [Rails.root.join('custom-path')]

  # Frequency for showing tips. Default: :always
  config.frequency = :always
  # Available options:
  #   :always, :half_hourly, :hourly, :every_two_hours, :every_three_hours,
  #   :every_four_hours, :every_five_hours, :every_six_hours, :every_seven_hours,
  #   :every_eight_hours, :every_nine_hours, :every_ten_hours, :every_eleven_hours,
  #   :every_twelve_hours, :daily, :every_two_days, :weekly,
  #
  # self.memory_file_path = File.expand_path("~/.get-smart-memory")
end
