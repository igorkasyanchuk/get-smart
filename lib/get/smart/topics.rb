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
      end
    end
  end
end
