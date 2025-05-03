class Get::Smart::AppContext
  def call
    {
      gems: gems,
      databases: database_adapters
    }
  end

  def gems
    @gems ||= Gem.loaded_specs.keys
  end

  def database_adapters
    {
      "mysql" => gems.include?("mysql2"),
      "postgresql" => gems.include?("pg"),
      "sqlite" => gems.any? { |gem| gem.start_with?("sqlite") }
    }.select { |_k, v| v }.keys
  end
end
