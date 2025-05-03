module Get
  module Smart
    class Topics
      class << self
        def all
          @topics ||= begin
            Get::Smart.paths.flat_map do |path|
              Get::Smart.log("getting topics for path: #{path}")
              res = Dir.glob(File.join(path, "*", "*")).select { |file| File.directory?(file) }
              directories = res.map { |file| file.gsub(path, "") }.reject { |file| file.empty? }

              directories.flat_map do |directory|
                Get::Smart::Topic.new(directory, path)
              end
            end
          end
        end

        def print_tree
          longest_name = Get::Smart::Topics.all.map(&:name).map(&:length).max

          puts "All topics:".white.on_green
          Get::Smart::Topics.all.each do |topic|
            print topic.name.to_s.ljust(longest_name + 1).yellow + " " + topic.files.size.to_s.green + "\n"
          end
        end
      end
    end
  end
end
