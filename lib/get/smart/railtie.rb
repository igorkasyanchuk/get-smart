module Get
  module Smart
    class Railtie < ::Rails::Railtie
      # https://github.com/rails/rails/blob/3235827585d87661942c91bc81f64f56d710f0b2/railties/lib/rails/railtie.rb

      config.after_initialize do |app|
        next unless Get::Smart.enabled

        # start only for "rails s" or "rails c"
        if defined?(Rails::Server) || defined?(Rails::Console)
          Get::Smart.logic = Get::Smart::Logic.new
          Get::Smart.logic.call
        end
      end

      rake_tasks do
        path = File.expand_path(__dir__)
        Dir.glob("#{path}/../../tasks/**/*.rake").each { |f| puts load f }
      end

      at_exit do
        Get::Smart.logic&.memory&.close
      end
    end
  end
end
