## 🔧 Define Custom Actor Groups for Granular Control
Built‑in groups cover simple cases, but you can register any predicate to target feature flags by business logic. This allows, for example, toggling features only for enterprise customers or users with specific traits.

```ruby
# config/initializers/flipper_groups.rb
Flipper.register(:enterprise_account) do |actor|
  next false unless actor.respond_to?(:account)
  actor.account&.tier == 'enterprise'
end

Flipper.register(:beta_tester) do |actor|
  actor.respond_to?(:beta_opt_in?) && actor.beta_opt_in?
end

# Enable feature for all enterprise accounts and 50% of beta testers
enable_group = Flipper.group(:enterprise_account)
enable_group_beta = Flipper.group(:beta_tester)
Flipper.enable(:advanced_reports, enable_group)
Flipper.enable_percentage_of_actors(:advanced_reports, 50, gate: :beta_tester)
```