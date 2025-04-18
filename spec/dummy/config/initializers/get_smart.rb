Get::Smart.setup do |config|
  config.debug = false

  # Enable or disable Get::Smart. Default: Rails.env.development?
  config.enabled = Rails.env.development?

  # Paths to scan for tip files. Default:
  config.paths += [ File.join(File.dirname(__FILE__), "..", "..", "..", "..", "spec", "files") ]

  # Frequency for showing tips. Default: :always
  config.frequency = :always
  # Available options:
  #   :always, :half_hourly, :hourly, :every_two_hours, :every_three_hours,
  #   :every_four_hours, :every_five_hours, :every_six_hours, :every_seven_hours,
  #   :every_eight_hours, :every_nine_hours, :every_ten_hours, :every_eleven_hours,
  #   :every_twelve_hours, :daily, :every_two_days, :weekly,
end
