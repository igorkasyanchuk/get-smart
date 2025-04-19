## 🛠 TracePoint for Live SQL Inspection

TracePoint enables you to hook deeply into the Ruby VM and inspect every call to your database adapter. By listening to the `:call` event on `AbstractAdapter#execute`, you can live-log, filter, or even pause for inspection whenever a query runs.

```ruby
# config/initializers/sql_trace.rb
TracePoint.new(:call) do |tp|
  if tp.defined_class == ActiveRecord::ConnectionAdapters::AbstractAdapter && tp.method_id == :execute
    sql, name = tp.binding.local_variable_get(:sql), tp.binding.local_variable_get(:name)
    Rails.logger.debug("[TRACE_SQL] ")
    Rails.logger.debug(sql)
    # Pause into byebug if you see an N+1 risk
    binding.break if sql =~ /SELECT.*FROM.*WHERE.*IN \(.*\)/
  end
end.enable
```

After restarting, every SQL execution will pass through this TracePoint. You can inspect `tp.binding` to dive into variables, or conditionally pause execution with `binding.break`.