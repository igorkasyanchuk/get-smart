## 🎛️ Customize Pry for Memory and Dependency Management

Override your console session via `~/.pryrc` to inject helpers for GC tuning, memory stats, and automatic dependency clearing between reloads. This setup turns your console into a lightweight profiling and hot‑reload playground.

```ruby
# ~/.pryrc
if defined?(Rails)
  Pry.config.prompt_name = "#{Rails.application.class.module_parent_name}-console"

  # GC and memory stats command
  Pry::Commands.block_command 'memstats', 'Show GC and heap statistics' do
    stats = GC.stat
    puts "Heap live slots: [36m#{stats[:heap_live_slots]}[0m"
    puts "Total objects allocated: [36m#{stats[:total_allocated_objects]}[0m"
  end

  # Auto-clear loaded constants for true code reload
  Pry.after_session do
    ActiveSupport::Dependencies.clear
    puts "[33mCleared loaded classes for fresh reload![0m"
  end
end
```