## 👥 Custom User Groups

Define custom groups to target dynamic cohorts like beta users, allowing flexible feature control. For example, register a `:beta_users` group based on a model flag and enable the feature for that group:

```ruby
Flipper.register(:beta_users) do |actor|
  actor.respond_to?(:beta?) && actor.beta?
end

flipper = Flipper.new(Flipper::Adapters::Memory.new)
flipper[:advanced_search].enable_group(:beta_users)
```

Then check the feature in your application code:

```ruby
if flipper[:advanced_search].enabled?(current_user)
  # show advanced search UI
end
```