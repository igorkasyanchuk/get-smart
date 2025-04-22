module Get
  module Smart
    class Topics
      def available_topics
        @available_topics ||= Get::Smart::Collection.new.topics.values.flatten
      end

      def interested_topics
        # TODO
      end

      def topics
        available_topics & interested_topics
      end
    end
  end
end
