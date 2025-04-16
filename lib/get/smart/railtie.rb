module Get
  module Smart
    class Railtie < ::Rails::Railtie
      initializer "get_smart.boot" do |app|
        if Get::Smart.enabled
          Get::Smart.logic.call
        end
      end

      at_exit do
        Get::Smart.memory&.close
      end
    end
  end
end
