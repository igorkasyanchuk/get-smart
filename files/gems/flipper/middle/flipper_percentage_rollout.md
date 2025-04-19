## 🎯 Percentage Rollout

Use Flipper's percentage gates to gradually roll out new features to a subset of users or over time, minimizing risk. For example, enable the feature for 10% of actors based on their IDs:

```ruby
# Configure Flipper
flipper = Flipper.new(Flipper::Adapters::Redis.new)
# Enable feature for 10% of actorslipper[:new_dashboard].enable_percentage_of_actors(10)
```

You can also use a time-based rollout to enable the feature for a random subset of requests over time:

```ruby
# Enable feature for 5% of requests (time-based)
flipper[:new_dashboard].enable_percentage_of_time(5)
```