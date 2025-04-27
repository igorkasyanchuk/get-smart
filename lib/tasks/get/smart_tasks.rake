namespace :get_smart do
  desc "Print tree of all topics as tree"
  task tree: :environment do |_t, args|
    longest_name = Get::Smart::Topics.all.map(&:name).map(&:length).max

    puts "All topics:".white.on_green
    Get::Smart::Topics.all.each do |topic|
      print topic.name.to_s.ljust(longest_name + 1).yellow + " " + topic.files.size.to_s.green + "\n"
    end
  end
end
