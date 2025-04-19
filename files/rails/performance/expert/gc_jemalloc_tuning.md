## ⚙️ Tune Ruby GC with jemalloc and GC::Profiler

Reduce GC pauses by switching to jemalloc (or tcmalloc) and fine‐tuning Ruby's GC parameters. Combine this with `GC::Profiler` to spot allocation hotspots and adjust the heap slots dynamically.

```bash
# Use jemalloc in production
export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libjemalloc.so"

# In config/puma.rb
on_worker_boot do
  GC::Profiler.enable
  GC::OPTS[:min_heap_slots] = 200_000
  GC::OPTS[:heap_growth_factor] = 1.2
end
```

```ruby
# At runtime, print GC stats for your slow actions
ActiveSupport::Notifications.subscribe('process_action.action_controller') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  puts "GC time: "+GC::Profiler.result
end
```

Iterate on `:min_heap_slots` and `:heap_growth_factor` until you see fewer GC invocations under high load.