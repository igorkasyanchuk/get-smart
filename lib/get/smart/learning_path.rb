class Get::Smart::LearningPath
  MANDATORY_TOPICS = [
    "/files/rails/",
    "/files/ruby/",
    "/files/javascript/"
  ].freeze

  def call
    MANDATORY_TOPICS + contextual
  end

  def contextual
    result = context[:gems].map do |gem|
      "/files/gems/#{gem}/"
    end

    result += context[:databases].map do |database|
      "/files/sql/#{database}/"
    end

    if context[:databases].any?
      result += [ "/files/sql/general/" ]
    end

    if context[:gems].include?("redis")
      result += [ "/files/nosql/redis/" ]
    end

    result
  end

  private

  def context
    @context ||= Get::Smart::AppContext.new.call
  end
end
